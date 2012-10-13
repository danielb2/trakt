module Trakt
  class Movie
    include Connection
    def find(query)
      get('/search/movies.json/',clean_query(query))
    end
  end
end
