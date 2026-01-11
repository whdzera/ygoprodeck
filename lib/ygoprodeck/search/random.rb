module Ygoprodeck
  class Card
    def self.random
      url = "https://db.ygoprodeck.com/api/v7/cardinfo.php?num=1&offset=0&sort=random&cachebust&format=genesys&misc=yes"
      uri = URI(url)

      begin
        response = Net::HTTP.get(uri)
        load = JSON.parse(response)

        return nil if load["data"].nil? || load["data"].empty?

        load["data"][0]
      rescue StandardError
        { "error" => "Something went wrong" }
      end
    end
  end
end
