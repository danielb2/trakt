module Trakt
  class Search
    include Connection
    def movies(query)
      require_settings %w|apikey|
      get('/search/movies.json/',clean_query(query))
    end
    def shows(query)
      require_settings %w|apikey|
      get('/search/shows.json/',clean_query(query))
    end
    def episode(query)
      require_settings %w|apikey|
      get('/search/episodes.json/',clean_query(query))
    end
    def people(query)
      require_settings %w|apikey|
      get('/search/people.json/',clean_query(query))
    end
    def users(query)
      require_settings %w|apikey|
      get('/search/users.json/',clean_query(query))
    end
  end
end
