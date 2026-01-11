module Ygoprodeck
  class List
    attr_reader :list

    def self.is(list)
      # Encode query parameter to handle special characters properly
      url = "#{Ygoprodeck::Endpoint.is}cardinfo.php?fname=#{URI.encode_www_form_component(list)}&format=genesys&misc=yes"
      uri = URI(url)

      # Use timeout to prevent hanging on slow connections
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', open_timeout: 10, read_timeout: 10) do |http|
        http.get(uri.request_uri)
      end

      # Check HTTP status code first
      case response
      when Net::HTTPSuccess
        load = JSON.parse(response.body)

        if load.has_key?('error')
          { 'error' => load['error'] }
        elsif load['data'].nil? || load['data'].empty?
          { 'error' => 'No card matching your query was found in the database.' }
        else
          load['data']
        end
      else
        { 'error' => "HTTP request failed with status code: #{response.code}" }
      end
    rescue StandardError => e
      { 'error' => "An unexpected error occurred: #{e.message}" }
    end
  end
end
