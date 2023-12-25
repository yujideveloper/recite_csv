# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Reading file" do
  let!(:dummy_reader_class) do
    Class.new do
      include ::ReciteCSV::Reader::Builder.new(col1: "カラム1", col2: "カラム2")
    end
  end

  context "pass a file path" do
    context "specify encoding" do
      let(:path) { fixture_path("utf-8.csv") }
      let(:file_options) { "rb:UTF-8" }
      let(:reader) { dummy_reader_class.new(path, file_options: file_options) }

      it do
        rows = reader.each.to_a

        expect(rows[0]).to have_attributes col1: "値1", col2: "値2"
        expect(rows[1]).to have_attributes col1: "値①", col2: "値②"
      end
    end

    context "convert encoding (Shift_JIS -> UTF-8)" do
      let(:path) { fixture_path("sjis.csv") }
      let(:file_options) do
        ["rb:Shift_JIS:UTF-8", { invalid: :replace, undef: :replace }]
      end
      let(:reader) { dummy_reader_class.new(path, file_options: file_options) }

      it do
        rows = reader.each.to_a

        expect(rows[0]).to have_attributes col1: "値1", col2: "値2"
        expect(rows[1]).to have_attributes col1: "値\uFFFD", col2: "値\uFFFD"
      end
    end
  end

  context "passa a file object" do
    context "specify encoding" do
      let(:file) do
        File.open(fixture_path("utf-8.csv"), "rb:UTF-8")
      end
      let(:reader) { dummy_reader_class.new(file) }

      it do
        rows = reader.each.to_a

        expect(rows[0]).to have_attributes col1: "値1", col2: "値2"
        expect(rows[1]).to have_attributes col1: "値①", col2: "値②"
      end
    end

    context "convert encoding (Shift_JIS -> UTF-8)" do
      let(:file) do
        File.open(fixture_path("sjis.csv"), "rb:Shift_JIS:UTF-8",
                  undef: :replace, invalid: :replace)
      end
      let(:reader) { dummy_reader_class.new(file) }

      it do
        rows = reader.each.to_a

        expect(rows[0]).to have_attributes col1: "値1", col2: "値2"
        expect(rows[1]).to have_attributes col1: "値\uFFFD", col2: "値\uFFFD"
      end
    end
  end
end
