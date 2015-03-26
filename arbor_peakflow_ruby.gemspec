# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arbor_peakflow_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "arbor_peakflow_ruby"
  spec.version       = Arbor::Peakflow::VERSION
  spec.authors       = ["Kevin Kirsche"]
  spec.email         = ["kevin.kirsche@verizon.com"]

  spec.summary       = %q{Arbor Peakflow 6.0 API interaction gem}
  spec.description   = %q{Provides access to the Arbor Peakflow SP 6.0 HTTPS API}
  spec.homepage      = "https://github.com/kkirsche/arbor-peakflow-ruby"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "faraday", "~> 0.9.1"
end
