# frozen_string_literal: true

require "recite_csv/writer/row"
require "recite_csv/writer/core"
require "recite_csv/writer/dsl"

module ReciteCSV
  module Writer
    class Builder < ::Module
      def initialize(&block)
        @row_class = ::Class.new(Row::Base) do |klass|
          klass.class_exec(&block) if block_given?
        end
      end

      private

      def included(class_or_module)
        class_or_module.include Core
        class_or_module.const_set(:Row, @row_class)
        class_or_module.const_set(:DEFAULT_CSV_OPTIONS, {}.freeze)
        class_or_module.extend DSL
      end
    end
  end
end
