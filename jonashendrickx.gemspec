# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jonas-hendrickx"
  spec.version       = "1.0.0"
  spec.authors       = ["Jonas Hendrickx"]
  spec.email         = []

  spec.summary       = "A minimal and beautiful Jekyll theme best for writing and note-taking."
  spec.homepage      = "https://github.com/jonashendrickx/jonashendrickx.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.6"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.13"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "kramdown-parser-gfm", "~> 1.1"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
end
