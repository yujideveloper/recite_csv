# frozen_string_literal: true

module ReciteCSV
  module Writer
    module Row
      class Base
        def initialize
          raise ::NotImplementedError, "#{__method__} must be overriddn."
        end

        def to_a
          raise ::NotImplementedError, "#{__method__} must be overriddn."
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
