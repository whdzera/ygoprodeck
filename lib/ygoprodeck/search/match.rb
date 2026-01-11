module Ygoprodeck
  class Match
    def self.normalize(text)
      text.downcase.gsub(/[^a-z0-9\s-]/, '').strip
    end

    def self.is(name_card)
      json_path = File.expand_path('assets/names_card.json', __dir__)
      names = JSON.parse(File.read(json_path))

      normalized_input = normalize(name_card)
      input_words = normalized_input.split

      substring_matches = names.select { |name| normalize(name).include?(normalized_input) }

      if substring_matches.empty?
        word_matches = names.select do |name|
          name_words = normalize(name).split
          input_words.all? { |word| name_words.any? { |nw| nw.include?(word) } }
        end

        if word_matches.empty?
          matcher = Levenshtein.new(normalized_input)
          best_match = names.min_by { |name| matcher.match(normalize(name)) }
        else
          best_match = word_matches.min_by { |name| normalize(name).length }
        end
      else
        best_match = substring_matches.min_by { |name| normalize(name).length }
      end

      best_match
    end
  end
end
