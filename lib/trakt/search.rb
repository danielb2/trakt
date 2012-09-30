module Trakt
  class Search
    extend Connection
    class << self
      def movie(query)
        get('/search/movies.json/',clean_query(query))
      end
      def show(query)
        get('/search/shows.json/',clean_query(query))
      end
      def episode(query)
        get('/search/episodes.json/',clean_query(query))
      end
      def people(query)
        get('/search/people.json/',clean_query(query))
      end
      def users(query)
        get('/search/users.json/',clean_query(query))
      end
    end
  end
end
