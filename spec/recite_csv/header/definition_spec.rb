require "spec_helper"

RSpec.describe ReciteCSV::Header::Definition do
  describe "#dispatch" do
    subject do
      described_class.dispatch(object)
    end

    context "pass a hash object" do
      let(:object) { { col1: "COL1", col2: "COL2" } }
      it { is_expected.to be_a ReciteCSV::Header::Definition::Hash }
    end

    context "pass a subclass object of hash" do
      let(:object) { Class.new(Hash).new(col1: "COL1", col2: "COL2") }
      it { is_expected.to be_a ReciteCSV::Header::Definition::Hash }
    end

    context "pass a array object" do
      let(:object) { %w[col1 col2] }

      it { is_expected.to be_a ReciteCSV::Header::Definition::Array }
    end

    context "pass a subclass object of array" do
      let(:object) { Class.new(Array).new(%w[col1 col2]) }

      it { is_expected.to be_a ReciteCSV::Header::Definition::Array }
    end

    context "pass a nil object" do
      let(:object) { nil }
      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe ReciteCSV::Header::Definition::Hash do
    describe "#default_csv_options" do
      subject { described_class.new({}).default_csv_options }

      it { is_expected.to eq(headers: :first_row) }
    end
  end

  describe ReciteCSV::Header::Definition::Array do
    describe "#default_csv_options" do
      subject { described_class.new([]).default_csv_options }

      it { is_expected.to eq({}) }
    end
  end
end
