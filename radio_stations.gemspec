require_relative 'lib/radio_stations/version'

Gem::Specification.new do |spec|
  spec.name          = "radio_stations"
  spec.version       = RadioStations::VERSION
  spec.authors       = ["kelseyshiba"]
  spec.email         = ["kelsey.shiba@gmail.com"]

  spec.summary       = "This is a gem to help you find radio stations worldwide"}
  spec.description   = "This is a gem to help you find radio stations worldwide"
  spec.homepage      = "https://github.com/kelseyshiba/radio_stations"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/kelseyshiba/radio_stations"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kelseyshiba/radio_stations."
  spec.metadata["changelog_uri"] = "https://github.com/kelseyshiba/radio_stations."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 3.0"
  
end
