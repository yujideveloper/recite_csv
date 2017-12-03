# frozen_string_literal: true

require "spec_helper"

RSpec.describe ReciteCSV::Reader::Builder do
  describe "#new" do
    let(:reader_module) { described_class.new(header) }

    context "pass a hash header" do
      let(:header) { { col1: "COL1", col2: "COL2" } }

      subject { reader_module }

      it { is_expected.to be_instance_variable_defined :@row_class }
      it { is_expected.to be_instance_variable_defined :@definition }

      describe "@row_class" do
        subject { reader_module.instance_variable_get :@row_class }

        it { is_expected.to be < ReciteCSV::Row::Base }
        it { is_expected.to be_method_defined :col1 }
        it { is_expected.to be_method_defined :col2 }
        it { is_expected.not_to be_method_defined :col3 }
      end

      describe "@definition" do
        subject { reader_module.instance_variable_get :@definition }

        it { is_expected.to be_a ReciteCSV::Header::Definition::Hash }
      end
    end

    context "pass a array header" do
      let(:header) { %w[col1 col2 col3] }

      subject { reader_module }

      it { is_expected.to be_instance_variable_defined :@row_class }
      it { is_expected.to be_instance_variable_defined :@definition }

      describe "@row_class" do
        subject { reader_module.instance_variable_get :@row_class }

        it { is_expected.to be < ReciteCSV::Row::Base }
        it { is_expected.to be_method_defined :col1 }
        it { is_expected.to be_method_defined :col2 }
        it { is_expected.to be_method_defined :col3 }
      end

      describe "@definition" do
        subject { reader_module.instance_variable_get :@definition }

        it { is_expected.to be_a ReciteCSV::Header::Definition::Array }
      end
    end
  end

  describe "#included" do
    let(:reader_module) { described_class.new(header) }
    let(:reader) { Class.new.include reader_module }

    context "hash header" do
      let(:header) { { col1: "COL1", col2: "COL2" } }

      subject { reader }

      it { is_expected.to be_include ReciteCSV::Reader::Core }
      it { is_expected.to be_const_defined :Row }
      it { is_expected.to be_const_defined :DEFAULT_CSV_OPTIONS }
      it { is_expected.to respond_to :row_methods }
    end

    context "array header" do
      let(:header) { %w[col1 col2] }

      subject { reader }

      it { is_expected.to be_include ReciteCSV::Reader::Core }
      it { is_expected.to be_const_defined :Row }
      it { is_expected.to be_const_defined :DEFAULT_CSV_OPTIONS }
      it { is_expected.to respond_to :row_methods }
    end
  end
end
