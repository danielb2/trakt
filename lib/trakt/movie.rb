module Trakt
  class Movie
    extend Connection
    class << self
      def find(query)
        get('/search/movies.json/',clean_query(query))
      end
    end
  end
end
