module Ygoprodeck
  class Image
    attr_reader :image_by_id

    def self.is(image_by_id)
      "https://images.ygoprodeck.com/images/cards/#{image_by_id}.jpg"
    end
  end

  class Image_small
    attr_reader :image_small_by_id

    def self.is(image_small_by_id)
      "https://images.ygoprodeck.com/images/cards_cropped/#{image_small_by_id}.jpg"
    end
  end
end
