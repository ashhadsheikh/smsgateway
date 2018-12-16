
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "smsgateway/version"

Gem::Specification.new do |spec|
  spec.name          = "smsgateway"
  spec.version       = Smsgateway::VERSION
  spec.authors       = ["Ashhad Sheikh"]
  spec.email         = ["ashhadsheikh@hotmail.com"]
  spec.summary       = %q{A ruby gem to interact with smsgateway.me API!}
  spec.description   = %q{A ruby gem to interact with smsgateway.me API}
  spec.homepage      = "https://github.com/ashhadsheikh/smsgateway"
  spec.license       = "MIT"
  spec.files            = ['lib/smsgateway.rb', 'lib/api.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = 'MIT'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end