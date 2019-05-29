# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "recite_csv/version"

Gem::Specification.new do |spec|
  spec.name          = "recite_csv"
  spec.version       = ReciteCSV::VERSION
  spec.authors       = ["Yuji Hanamura"]
  spec.email         = ["yuji.developer@gmail.com"]

  spec.summary       = "ReciteCSV helps to build a class for CSV reader."
  spec.description   = "ReciteCSV helps to build a class for CSV reader."
  spec.homepage      = "https://github.com/yujideveloper/recite_csv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4"

  spec.add_development_dependency "bundler", ">= 1.14"
  spec.add_development_dependency "pry", ">= 0.10.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", ">= 0.70.0"
  spec.add_development_dependency "rubocop-performance", ">= 1.3.0"
end
