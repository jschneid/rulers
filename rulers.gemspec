lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |spec|
  spec.name          = 'rulers'
  spec.version       = Rulers::VERSION
  spec.authors       = ['Jon Schneider']
  spec.email         = ['jon.schneider@gmail.com']

  spec.summary       = %q(My implementation of Noah Gibbs' "Rebuilding Rails".)
  spec.description   = %q{My implementation of Noah Gibbs' "Rebuilding Rails" (https://rebuilding-rails.com/).}
  spec.homepage      = 'https://github.com/jschneid/rulers'

  spec.metadata['allowed_push_host'] = 'http://jonschneider.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jschneid/rulers'
  spec.metadata['changelog_uri'] = 'https://github.com/jschneid/rulers/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'erubis'
  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency 'rack'
  spec.add_runtime_dependency 'sqlite3'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'test-unit'
end
