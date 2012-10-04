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
require "trakt/movie"
require "trakt/search"
require "trakt/activity"
require "trakt/calendar"
require "trakt/show"
require "trakt/friends"

module Trakt
  class Error < RuntimeError
  end
end
module Trakt
  
  @settings = {}
  # setting various settings that are often a must-have. example:
  #
  #     Trakt.set :apikey, 'your_api_key'
  #     Trakt.set :username, 'your_username'
  #     Trakt.set :password, 'your_password'
  def self.set(what, value)
    @settings[what.to_sym] = value
  end

  def self.settings
    @settings
  end
end
