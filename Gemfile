source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', versions['github-pages']
gem 'github_api'
gem 'kramdown'
gem 'stringex'
gem 'nokogiri', versions['nokogiri']