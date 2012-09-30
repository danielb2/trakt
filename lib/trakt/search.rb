module Trakt
  class Search
    extend Connection
    class << self
      def movies(query)
        get('/search/movies.json/',clean_query(query))
      end
      def shows(query)
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
