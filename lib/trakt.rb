require "trakt/version"
require 'awesome_print'
require 'open-uri'
require "json"
require "excon"
require "digest"
require "uri"

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
  class List
    class << self
      def connection
        @connection ||= Excon.new("http://api.trakt.tv");
      end
      # TODO options should be the various options at some point
      def create(name, options={})
        body = {
          'username' => Trakt.settings[:username],
          'password' => Trakt.settings[:password],
          'privacy' => 'private',
          'description' => "something here",
          'name' => name,
        }
        result = connection.post(:path => "/lists/items/add/" + Trakt.settings[:apikey], :body => body.to_json)
        if result.status == 'failure'
          return nil
        end
        parsed_result = JSON.parse result.body
        return self.new(parsed_result['slug'])
      end
    end
    attr_accessor :slug
    def initialize(slug)
      @slug = slug
    end
    def add_item(data)
      body = {
          'slug' => self.slug,
          'username' => Trakt.settings[:username],
          'password' => Trakt.settings[:password],
          'items'    => [data],
      }
      result = self.class.connection.post(:path => "/lists/items/add/" + Trakt.settings[:apikey], :body => body.to_json)
    end
  end
  module Connection
    def connection
      @connection ||= Excon.new("http://api.trakt.tv");
    end
    def require_settings(required)
      required.each do |setting|
        raise "Required setting #{setting} is missing." unless Trakt.settings[setting.to_sym]
      end
    end
    def post(path,body)
      result = connection.post(:path => path + Trakt.settings[:apikey], :body => body.to_json)
      parse(result)
    end
    def parse(result)
      parsed =  JSON.parse result.body
      if parsed.kind_of? Hash and parsed['status'] and parsed['status'] == 'failure'
        raise Error.new(parsed['error'])
      end
      return parsed
    end
    def clean_query(query)
      query.gsub(/[()]/,'').
        gsub(' ','+').
        gsub('&','and').
        gsub('!','').
        chomp
    end
    def get(path,query)
      result = connection.get(:path => path + Trakt.settings[:apikey] + '/' + query)
      parse(result)
    end
  end
  class Account
    extend Connection
    class << self
      def settings
        require_settings %w|username password apikey|
        body = {
          'username' => Trakt.settings[:username],
          'password' => Trakt.settings[:password],
        }
        post 'account/settings/', body
      end
    end
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
