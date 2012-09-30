module Trakt
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
end
