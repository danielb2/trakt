require "trakt/version"
require 'awesome_print'
require 'open-uri'
require "json"
require "excon"
require "digest"
require "uri"
require "trakt/connection"
require "trakt/account"
require "trakt/list"

module Trakt
  class Error < RuntimeError
  end
end
module Trakt
  @settings = {}
  def self.set(what, value)
    @settings[what.to_sym] = value
  end
  def self.settings
    @settings
  end
  class Movie
    extend Connection
    class << self
      def find(query)
        get('/search/movies.json/',clean_query(query))
      end
    end
  end
end
