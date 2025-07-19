require "open-uri"
require "net/http"
require "json"
require "amatch"
include Amatch

Dir[File.join(__dir__, "ygoprodeck/**/*.rb")].sort.each { |f| require f }

module Ygoprodeck
end
