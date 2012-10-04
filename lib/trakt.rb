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
require "trakt/movies"

module Trakt
  class Error < RuntimeError
  end
end
module Trakt
  def self.new(*a)
    Trakt.new(*a)
  end
  class Trakt
    attr_accessor :username, :password, :apikey
    def initialize(args={})
      @username = args[:username]
      @password = args[:password]
      @apikey = args[:apikey]
    end
    def account
      @account ||= Account.new self
    end
    def calendar
      @calendar ||= Calendar.new self
    end
    def friends
      @calendar ||= Calendar.new self
    end
    def search
      @search ||= Search.new self
    end
  end
end
