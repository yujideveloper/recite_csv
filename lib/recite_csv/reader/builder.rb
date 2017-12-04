# frozen_string_literal: true

require "recite_csv/header"
require "recite_csv/row"
require "recite_csv/reader/core"
require "recite_csv/reader/dsl"

module ReciteCSV
  module Reader
    class Builder < ::Module
      def initialize(header_definition, &block)
        definition = Header::Definition.dispatch(header_definition)
        @definition = definition
        @row_class = ::Class.new(Row::Base) do |klass|
          klass.include definition.build_column_methods_module
          klass.class_exec(&block) if block_given?
        end
      end

      def included(class_or_module)
        class_or_module.include Core
        class_or_module.const_set(:Row, @row_class)
        class_or_module.const_set(:DEFAULT_CSV_OPTIONS,
                                  @definition.default_csv_options)
        class_or_module.extend DSL
      end
    end
  end
end
