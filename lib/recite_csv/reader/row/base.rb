# frozen_string_literal: true

module ReciteCSV
  module Reader
    module Row
      class Base
        attr_reader :_raw_data

        def initialize(raw_data)
          @_raw_data = raw_data
        end

        def [](key)
          self._raw_data[key]
        end

        def self.new(*)
          if self == Base
            raise ::NotImplementedError,
                  "#{self} is an abstract class and cannot be instantiated."
          end
          super
        end
      end
    end
  end
end
