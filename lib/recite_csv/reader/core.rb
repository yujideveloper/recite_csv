# frozen_string_literal: true

require "csv"

module ReciteCSV
  module Reader
    module Core
      include Enumerable

      attr_reader :file, :file_options, :csv_options

      def initialize(file, options = {})
        @file = file
        @file_options = options.delete(:file_options) || {}
        @csv_options =
          (options || {}).merge(self.class::DEFAULT_CSV_OPTIONS)
      end

      def each(&block)
        if block_given?
          _each(&block)
        else
          self.to_enum
        end
      end

      private

      def _each(&block)
        f = if self.file.is_a?(::String)
              ::File.open(self.file, *Array(self.file_options))
            else
              self.file
            end
        begin
          _foreach(f, &block)
        ensure
          f.close if self.file.is_a?(::String)
        end
      end

      def _foreach(file)
        ::CSV.new(file, self.csv_options).each do |raw_row|
          yield self.class::Row.new(raw_row)
        end
      end
    end
  end
end
