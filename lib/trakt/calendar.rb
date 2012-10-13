module Trakt
  class Calendar
    include Connection
    def premieres(*args)
      get_with_args('/calendar/premieres.json/', *args)
    end
    def shows(*args)
      get_with_args('/calendar/shows.json/', *args)
    end
  end
end
