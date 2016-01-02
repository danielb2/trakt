require "trakt/version"
require "json"
require "excon"
require "digest"
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
require "trakt/genres"

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
    def list
      @list ||= List.new self
    end
    def movie
      @movie ||= Movie.new self
    end
    def activity
      @activity ||= Activity.new self
    end
    def genres
      @genres ||= Genres.new self
    end
    def show
      @show ||= Show.new self
    end
  end
end
