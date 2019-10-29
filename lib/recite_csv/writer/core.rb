# frozen_string_literal: true

require "csv"

module ReciteCSV
  module Writer
    module Core
      attr_reader :file, :file_options, :csv_options

      def initialize(file, file_options: {}, **options)
        @file = file
        @file_options = file_options
        @csv_options = options.merge(self.class::DEFAULT_CSV_OPTIONS)
      end

      def run(args = [], &block)
        enum = block_given? ? ::Enumerator.new(&block) : args

        _run(enum)
      end

      private

      def _run(enum)
        f = _open
        begin
          _foreach(f, enum)
        ensure
          f.close if self.file.is_a?(::String)
        end
      end

      def _open
        return self.file unless self.file.is_a?(::String)

        args = Array(self.file_options)
        if args.last.is_a?(::Hash)
          args = args.dup
          kw_args = args.pop
          ::File.open(self.file, *args, **kw_args)
        else
          ::File.open(self.file, *args)
        end
      end

      def _foreach(file, enum)
        ::CSV.new(file, **self.csv_options).tap do |csv|
          enum.each do |*e|
            csv << self.class::Row.new(*e).to_a
          end
        end
      end
    end
  end
end
