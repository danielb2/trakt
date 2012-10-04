module Trakt
  class Friends
    include Connection
    def add(username)
      require_settings %w|username password apikey|
      post "friends/#{__method__}/", 'friend' => username
    end
    def all
      require_settings %w|username password apikey|
      post 'friends/all/'
    end
    def approve(username)
      require_settings %w|username password apikey|
      post "friends/#{__method__}/", 'friend' => username
    end
    def delete(username)
      require_settings %w|username password apikey|
      post "friends/#{__method__}/", 'friend' => username
    end
    def deny
      require_settings %w|username password apikey|
      post "friends/#{__method__}/", 'friend' => username
    end
    def requests(username)
      require_settings %w|username password apikey|
      post 'friends/requests/'
    end
  end
end
