module ReciteCSV
  module Row
    class Base
      attr_reader :raw_data

      def initialize(raw_data)
        @raw_data = raw_data
      end

      def [](key)
        self.raw_data[key]
      end
    end
  end
end
