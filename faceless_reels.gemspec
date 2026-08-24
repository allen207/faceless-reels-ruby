require_relative "lib/faceless_reels/version"

Gem::Specification.new do |spec|
  spec.name = "faceless_reels"
  spec.version = FacelessReels::VERSION
  spec.authors = ["Allen328"]
  spec.email = ["support@faceless-reels.io"]

  spec.summary = "Ruby client for Faceless Reels public endpoints."
  spec.description =
    "A small Ruby client for checking Faceless Reels availability and " \
    "building URLs for its public showcase videos."
  spec.homepage = "https://faceless-reels.io"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =
    "https://github.com/allen207/faceless-reels-ruby"
  spec.metadata["documentation_uri"] =
    "https://www.rubydoc.info/gems/faceless_reels"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["LICENSE", "README.md", "lib/**/*.rb"]
  spec.require_paths = ["lib"]
end

