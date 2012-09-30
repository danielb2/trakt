module Trakt
  class Activity
    extend Connection
    class << self
      def activity(path,*args)
        require_settings %w|apikey|
        arg_path = *args.compact.map { |t| t.to_s}
        get(path, File.join(arg_path))
      end
      private :activity
      def community(*args)
        activity('/activity/community.json/', *args)
      end
      def episodes(*args)
        activity('/activity/episodes.json/', *args)
      end
      def friends(*args)
        activity('/activity/friends.json/', *args)
      end
      def movies(*args)
        activity('/activity/movies.json/', *args)
      end
      def seasons(*args)
        activity('/activity/seasons.json/', *args)
      end
      def shows(*args)
        activity('/activity/shows.json/', *args)
      end
      def user(*args)
        activity('/activity/user.json/', *args)
      end
    end
  end
end
