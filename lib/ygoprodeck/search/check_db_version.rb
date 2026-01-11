module Ygoprodeck
  class CheckDbVer
    def self.info
      url = "https://db.ygoprodeck.com/api/v7/checkDBVer.php"
      uri = URI(url)

      begin
        response = Net::HTTP.get_response(uri)

        return { 'error' => "HTTP request failed with status code: #{response.code}" } unless response.is_a?(Net::HTTPSuccess)

        load = JSON.parse(response.body)

        if load.is_a?(Hash) && load.has_key?('error')
          { 'error' => load['error'] }
        else
          load
        end
      rescue StandardError => e
        { 'error' => "An unexpected error occurred: #{e.message}" }
      end
    end
  end
end
