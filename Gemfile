source 'https://rubygems.org'

require 'json'
require 'httparty'

response = HTTParty.get('https://pages.github.com/versions.json')

versions = JSON.parse(response.body)

gem 'github-pages', versions['github-pages']
gem 'github_api'
gem 'kramdown'
gem 'stringex'