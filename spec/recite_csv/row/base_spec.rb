# frozen_string_literal: true

require "spec_helper"

RSpec.describe ReciteCSV::Row::Base do
  let(:dummy_class) do
    Class.new(described_class)
  end
  let(:row) do
    dummy_class.new(col1: "val1", col2: "val2")
  end

  describe "#[]" do
    subject { row }

    it { expect(subject[:col1]).to eq "val1" }
    it { expect(subject[:col2]).to eq "val2" }
  end

  describe "#_raw_data" do
    subject { row._raw_data }

    it { is_expected.to eq(col1: "val1", col2: "val2") }
  end
end
