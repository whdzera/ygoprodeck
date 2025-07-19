module Ygoprodeck
  class ID
    def self.is(id)
      url = "#{Ygoprodeck::Endpoint.is}cardinfo.php?id=#{(id)}"
      uri = URI(url)

      begin
        response = Net::HTTP.get(uri)
        load = JSON.parse(response)

        return nil if load["data"].nil? || load["data"].empty?

        load["data"][0]
      rescue JSON::ParserError, SocketError, StandardError => e
        nil
      end
    end
  end
end
