# frozen_string_literal: true

require "bundler/setup"
require "recite_csv"

Dir[File.expand_path("support/**/*.rb", __dir__)].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.include FixtureHelpers

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
