require "trakt/version"
require 'awesome_print'
require 'open-uri'
require "json"
require "excon"
require "digest"
require "uri"

module Trakt
  @settings = {}
  def self.set(what, value)
    @settings[what] = value
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
  class Movie
    class << self
      def connection
        @connection ||= Excon.new("http://api.trakt.tv");
      end
      def search_path
      "/search/movies.json/" + Trakt.settings[:apikey] + '/'
      end
      def clean_query(query)
        query.gsub(/[()]/,'').
        gsub(' ','+').
        gsub('&','and').
        gsub('!','').
        chomp
      end
      def find(query)
        puts "Searching for: #{query}"
        begin
          result = connection.get(:path => search_path + clean_query(query))
          return JSON.parse result.body
        rescue
          puts "Something went amiss with your query: `#{query}` (#{clean_query(query)})"
          exit;
        end
      end
    end
  end
end
