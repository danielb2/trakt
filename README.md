# Trakt

This is a Ruby API for the http://trakt.tv movie, tvshow service.

## Installation

Add this line to your application's Gemfile:

    gem 'trakt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trakt

## Usage

All calls return an JSON structure.

This is a typical default setup

    require 'trakt'
    Trakt.set :apikey, 'your_api_key'
    Trakt.set :username, 'your_username'
    Trakt.set :password, 'your_password'


### settings

    Trakt::Account.settings

### searching

    Trakt::Account.movies "the shawshank redemption"
    Trakt::Account.shows "death note"

### managing shows

Example making all episodes of season 4 of winnie the pooh unseen. (You can use
Trakt::Search.shows("the new adventures of winnie the pooh").first to get the
imdb_id)

    episodes = []
    1.upto(11) { |n|
      episodes << { "season" =>  4, "episode" => n }
    }
    Trakt::Show.episode_unseen("imdb_id" => "tt0165052", episodes: episodes)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
