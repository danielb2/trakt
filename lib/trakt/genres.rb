module Trakt
  class Genres
    include Connection
    def movies
      require_settings %w|apikey|
      get "/genres/movies.json",''
    end
    def shows
      require_settings %w|apikey|
      get "/genres/shows.json",''
    end
  end
end
