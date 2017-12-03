# frozen_string_literal: true

require "csv"

module ReciteCSV
  module Reader
    module Core
      include Enumerable

      attr_reader :file, :csv_options

      def initialize(file, csv_options = {})
        @file = file
        @csv_options = (csv_options || {}).merge(self.class::DEFAULT_CSV_OPTIONS)
      end

      def each
        if block_given?
          ::CSV.foreach(self.file, self.csv_options) do |raw_row|
            yield self.class::Row.new(raw_row)
          end
        else
          self.to_enum
        end
      end
    end
  end
end
