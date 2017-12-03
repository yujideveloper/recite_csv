# frozen_string_literal: true

require "spec_helper"

RSpec.describe ReciteCSV::Reader::DSL do
  describe ".raw_methotds" do
    let(:dummy_class) do
      Class.new do
        const_set(:Row, Class.new do
          include(Module.new do
            def foo
              "foo"
            end
          end)
        end)
        extend ReciteCSV::Reader::DSL
        row_methods do
          def foo
            "overridden #{super}"
          end

          def bar
            "bar"
          end
        end
      end
    end

    subject { dummy_class::Row }

    it { is_expected.to be_method_defined :foo }
    it { is_expected.to be_method_defined :bar }

    describe "return value of method" do
      describe "foo" do
        subject { dummy_class::Row.new.foo }

        it { is_expected.to eq "overridden foo" }
      end

      describe "bar" do
        subject { dummy_class::Row.new.bar }

        it { is_expected.to eq "bar" }
      end
    end
  end
end
