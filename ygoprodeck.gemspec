lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ygoprodeck/version"

Gem::Specification.new do |spec|
  spec.name = "ygoprodeck"
  spec.version = Ygoprodeck::VERSION
  spec.authors = ["Rokhimin Wahid"]
  spec.email = ["whdzera@gmail.com"]
  spec.summary = "ygoprodeck API wrapper for search yugioh's card"
  spec.description = "ygoprodeck API wrapper for search yugioh card"
  spec.homepage = "http://github.com/whdzera/ygoprodeck"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables =
    `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"

  spec.add_dependency "amatch", "~> 0.4.1"
  spec.add_development_dependency "bundler", "~> 2.5.23"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-prof", "~> 0.0.7"
  spec.add_development_dependency "syntax_tree", "6.2.0"
end
