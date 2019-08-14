lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fluent/version"

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-monitor-agent-modified"
  spec.version       = Fluent::VERSION
  spec.authors       = ["wanfeng.hu"]
  spec.email         = ["wanfeng.hu@ihandysoft.com"]
  spec.license       = "Apache-2.0"

  spec.summary       = %q{Outputs monitor informations for fluentd}
  spec.description   = %q{Modified version of default in_monitor_agent in fluentd. It can monitor number of emitted records during emit_interval when tag is configured.}
  spec.homepage      = "https://github.com/BlackNight95/fluent-plugin-monitor-agent-modified"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # build gem for a certain platform. see also Rakefile
  fake_platform = ENV['GEM_BUILD_FAKE_PLATFORM'].to_s
  spec.platform = fake_platform unless fake_platform.empty?
  if /mswin|mingw/ =~ fake_platform || (/mswin|mingw/ =~ RUBY_PLATFORM && fake_platform.empty?)
    spec.add_runtime_dependency("win32-service", ["~> 0.8.3"])
    spec.add_runtime_dependency("win32-ipc", ["~> 0.6.1"])
    spec.add_runtime_dependency("win32-event", ["~> 0.6.1"])
    spec.add_runtime_dependency("windows-pr", ["~> 1.2.5"])
  end
  
  spec.add_dependency "fluentd", ">= 0.14.10", "< 2"
  spec.add_development_dependency("rake", ["~> 11.0"])
  spec.add_development_dependency("flexmock", ["~> 2.0"])
  spec.add_development_dependency("parallel_tests", ["~> 0.15.3"])
  spec.add_development_dependency("simplecov", ["~> 0.7"])
  spec.add_development_dependency("rr", ["~> 1.0"])
  spec.add_development_dependency("timecop", ["~> 0.3"])
  spec.add_development_dependency("test-unit", ["~> 3.2"])
  spec.add_development_dependency("test-unit-rr", ["~> 1.0"])
  spec.add_development_dependency("oj", [">= 2.14", "< 4"])
end
