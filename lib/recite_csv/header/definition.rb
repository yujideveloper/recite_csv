# frozen_string_literal: true

module ReciteCSV
  module Header
    module Definition
      class Base
        attr_reader :raw_definition

        def initialize(raw_definition)
          @raw_definition = raw_definition
        end

        def build_column_methods_module
          self.class::ColumnMethodsBuilder.new(self.raw_definition)
        end

        def default_csv_options
          {}.freeze
        end

        def self.new(*)
          if self == Base
            raise ::NotImplementedError, "#{self} is an abstract class and cannot be instantiated."
          end
          super
        end
      end

      class Hash < Base
        DEFAULT_CSV_OPTIONS = { headers: :first_row }.freeze

        class ColumnMethodsBuilder < ::Module
          def initialize(raw_definition)
            raw_definition.each do |method_name, header_name|
              define_method method_name do
                self[header_name]
              end
            end
          end
        end

        def default_csv_options
          DEFAULT_CSV_OPTIONS
        end
      end

      class Array < Base
        class ColumnMethodsBuilder < ::Module
          def initialize(raw_definition)
            raw_definition.each.with_index do |name, idx|
              next if name.nil? || name.empty?
              define_method name do
                self[idx]
              end
            end
          end
        end
      end

      DEFINITIONS = {
        ::Hash => Hash,
        ::Array => Array
      }.freeze

      module_function

      def dispatch(header_definition)
        _, definition_class = DEFINITIONS.find { |klass, _| header_definition.is_a? klass }
        raise ::ArgumentError, "Unexpected header definition type" unless definition_class
        definition_class.new(header_definition)
      end
    end
  end
end
