module Trakt
  class Account
    extend Connection
    class << self
      def settings
        require_settings %w|username password apikey|
        post 'account/settings/'
      end
      def test
        require_settings %w|username password apikey|
        post 'account/test/'
      end
    end
  end
end
