module Ygoprodeck
  class Archetype
    attr_reader :archetype

    def self.is(archetype)
      url =
        "#{Ygoprodeck::Endpoint.is}cardinfo.php?archetype=#{URI.encode_www_form_component(archetype)}&format=genesys&misc=yes"
      uri = URI(url)

      begin
        response = Net::HTTP.get(uri)
        load = JSON.parse(response)

        if load["data"].nil? || load["data"].empty?
          {
            "error" => "No card matching your query was found in the database."
          }
        else
          load["data"]
        end
      rescue StandardError
        { "error" => "Something went wrong" }
      end
    end
  end
end
