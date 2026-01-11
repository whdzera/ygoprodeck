require 'net/http'
require 'json'
require 'uri'

module Ygoprodeck
  class Banlist
    API_BASE = 'https://ygoprodeck.com/api/banlist'.freeze

    def self.fetch_banlist(format)
      url = "#{Ygoprodeck::Endpoint.is}cardinfo.php?banlist=#{format}"
      uri = URI(url)

      begin
        response = Net::HTTP.get(uri)
        load = JSON.parse(response)

        if load.has_key?('error')
          { 'error' => load['error'] }
        else
          load
        end
      rescue JSON::ParserError
        { 'error' => 'Failed to parse JSON response' }
      rescue SocketError
        { 'error' => 'Network connection error' }
      rescue StandardError => e
        { 'error' => "An unexpected error occurred: #{e.message}" }
      end
    end

    def self.tcg
      fetch_banlist('tcg')
    end

    def self.ocg
      fetch_banlist('ocg')
    end

    def self.goat
      fetch_banlist('goat')
    end

    def self.md
      dates_uri = URI("#{API_BASE}/getBanListDates.php")
      dates_res = Net::HTTP.get(dates_uri)
      dates = JSON.parse(dates_res)

      master_duel_dates = dates.select { |d| d['type'] == 'Master Duel' }
      return { 'error' => 'No Master Duel dates found' } if master_duel_dates.empty?

      latest_date = master_duel_dates.map { |d| d['date'] }.max

      list_uri = URI("#{API_BASE}/getBanList.php?list=Master%20Duel&date=#{latest_date}")
      req = Net::HTTP::Get.new(list_uri)
      req['User-Agent'] = 'Mozilla/5.0'

      res = Net::HTTP.start(list_uri.host, list_uri.port, use_ssl: true) do |http|
        http.request(req)
      end

      load = JSON.parse(res.body)

      if load.is_a?(Hash) && load.key?('error')
        { 'error' => load['error'] }
      else
        load
      end
    rescue JSON::ParserError
      { 'error' => 'Failed to parse JSON response' }
    rescue SocketError
      { 'error' => 'Network connection error' }
    rescue StandardError => e
      { 'error' => "An unexpected error occurred: #{e.message}" }
    end
  end
end
