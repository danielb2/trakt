module Trakt
  class Show
    extend Connection
    class << self
      def episode_unseen(data)
        require_settings %w|username password apikey|
        body = {
          'username' => Trakt.settings[:username],
          'password' => Trakt.settings[:password],
        }
        body.merge!(data)
        post('show/episode/unseen/', body)
    end
    end
  end
end
