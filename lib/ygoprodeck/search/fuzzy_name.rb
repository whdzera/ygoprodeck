module Ygoprodeck
  class Fname
    attr_reader :f_name

    def self.is(f_name)
      url = "#{Ygoprodeck::Endpoint.is}cardinfo.php?fname=#{URI.encode_www_form_component(f_name)}&format=genesys&misc=yes"
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
