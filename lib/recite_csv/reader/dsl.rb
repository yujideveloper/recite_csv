# frozen_string_literal: true

module ReciteCSV
  module Reader
    module DSL
      def row_methods(&block)
        self::Row.class_exec(&block)
      end
    end
  end
end
