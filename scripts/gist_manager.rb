require 'github_api'
require 'open-uri'

class GistManager
    attr_accessor :gh, :username, :repo

    def initialize
        @gh = Github.new oauth_token: ENV["gist_token"], auto_pagination: true
        @username = gh.users.get.login
        @repo = gh.repos user: username, repo: 'Project-Euler'
    end

    def delete_gists
        get_all_gists.each do |gist|
            gh.gists.delete id: gist.id
        end
    end

    def get_all_gists
        @gh.gists.list
    end

    def create_gist(problem)
        files = build_files_hash(problem)
        @gh.gists.create description: "#{problem.name}", public: true, files: files
    end

    def build_files_hash(problem)
        files = {
            "#{problem.name}": {
                content: get_content(problem.download_url)
            }
        }

        return files
    end

    def get_content(url)
        open(url).read
    end

    def print_gist_hash
        gists = @gh.gists.list
        gist_hash = build_gist_hash(gists)

        gist_hash.each do |key, value|
            puts "#{key}: #{value[:embed_url]}"
        end
    end

    def build_gist_hash(gists)
        gist_hash = {}

        gists.each do |gist|
            gist_hash[gist.description] = {
                id: gist.id,
                embed_url: "<script src='https://gist.github.com/#{@username}/#{gist.id}.js'></script>"
            }
        end

        return gist_hash
    end

    def create_or_update_gists
        gists = @gh.gists.list
        gist_hash = build_gist_hash(gists)

        file_regex = /Problem\d+\.py/
        completed_problems = @repo.contents.get path: 'problems/completed'
        completed_problems.each do |problem|
            if file_regex =~ problem.name
                if gist_hash.has_key?(problem.name)
                    id = gist_hash[problem.name][:id]
                    @gh.gists.edit id: id, files: build_files_hash(problem)
                else
                    create_gist(problem)
                end
            end
        end
    end

    def update_gist(gist_id, files)
        @gh.gists.edit id: gist_id, files: files
    end
end

gm = GistManager.new
gm.create_or_update_gists
gm.print_gist_hash
