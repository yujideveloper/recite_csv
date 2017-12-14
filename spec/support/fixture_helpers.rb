# frozen_string_literal: true

module FixtureHelpers
  def fixture_path(path)
    File.join(root_path, "spec", "fixtures", path)
  end

  def root_path
    File.expand_path("../../", __dir__)
  end
end
