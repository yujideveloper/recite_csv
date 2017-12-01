# frozen_string_literal: true

module ReciteCSV
  module Row
    class Base
      attr_reader :_raw_data

      def initialize(raw_data)
        @_raw_data = raw_data
      end

      def [](key)
        self._raw_data[key]
      end
    end
  end
end
