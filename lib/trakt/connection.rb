module Trakt
  module Connection
    attr_reader :trakt
    def initialize(trakt)
      @trakt = trakt
    end
    def connection
      @connection ||= Excon.new("http://api.trakt.tv");
    end
    def require_settings(required)
      required.each do |setting|
        raise "Required setting #{setting} is missing." unless trakt.send(setting)
      end
    end
    def post(path,body={})
      # all posts have username/password
      body.merge!({
          'username' => trakt.username,
          'password' => trakt.password,
      })
      path << '/' unless path[-1] == '/'
      result = connection.post(:path => path + trakt.apikey, :body => body.to_json)
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
      full_path = File.join(path,trakt.apikey, query);
      full_path.gsub!(%r{/*$},'')
      result = connection.get(:path => full_path)
      parse(result)
    end
    def get_with_args(path,*args)
      require_settings %w|apikey|
      arg_path = *args.compact.map { |t| t.to_s}
      get(path, File.join(arg_path))
    end
    private :get_with_args, :get, :post, :parse, :clean_query, :require, :connection
  end
end
