module Trakt
  class Calendar
    extend Connection
    class << self
      def calendar(path,*args)
        require_settings %w|apikey|
        arg_path = *args.compact.map { |t| t.to_s}
        get(path, File.join(arg_path))
      end
      private :calendar
      def premieres(*args)
        calendar('/calendar/premieres.json/', *args)
      end
      def shows(*args)
        calendar('/calendar/shows.json/', *args)
      end
    end
  end
end
