module Trakt
  # Refer to the api doc on what parameters these functions take. http://trakt.tv/api-docs/get_with_args-community
  # For eaxmple, the current description for community reads:
  #
  #     http://api.trakt.tv/get_with_args/community.format/apikey/types/actions/start_ts/end_ts
  #
  # So you just do: <tt>Trakt::get_with_args.community(<types>,<actions>,<start_ts>,<end_ts>)</tt>
  class Activity
    include Connection
    def community(*args)
      get_with_args('/activity/community.json/', *args)
    end
    def episodes(*args)
      get_with_args('/activity/episodes.json/', *args)
    end
    def friends(*args)
      get_with_args('/activity/friends.json/', *args)
    end
    def movies(*args)
      get_with_args('/activity/movies.json/', *args)
    end
    def seasons(*args)
      get_with_args('/activity/seasons.json/', *args)
    end
    def shows(*args)
      get_with_args('/activity/shows.json/', *args)
    end
    def user(*args)
      get_with_args('/activity/user.json/', *args)
    end
  end
end
