module Trakt
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
      def test
        require_settings %w|username password apikey|
        body = {
          'username' => Trakt.settings[:username],
          'password' => Trakt.settings[:password],
        }
        post 'account/test/', body
      end
    end
  end
end
