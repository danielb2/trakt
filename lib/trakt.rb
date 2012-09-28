require "trakt/version"
require 'awesome_print'
require 'open-uri'
require "json"

module Trakt
  def self.set(what, value)
  @settings = {}
    @settings[what] = value
  end
  def self.settings
    @settings
  end
  class Movie
    def self.get_url
      "http://api.trakt.tv/search/movies.json/" + Trakt.settings[:apikey]
    end
    def self.find(search)
      result = open(get_url + "/uncle+buck")
      JSON.parse result.read
    end
  end
end
