require 'github_api'
require 'open-uri'

def delete_all_gists()
    all_gists.each do |gist|
        gh.gists.delete id: gist.id
    end
end

def create_gists(completed_problems)
    completed_problems.each do |problem|
        if file_regex =~ problem.name
            content = open(problem.download_url).read
            files = {
                "#{problem.name}": {
                    content: content
                }
            }
            gh.gists.create description: "#{problem.name}", public: true, files: files
        end
    end
end

def update_gists(completed_problems)

end

gh = Github.new oauth_token: ENV["gist_token"]
username = gh.users.get.login
repo = gh.repos user: username, repo: 'Project-Euler'
completed_problems = repo.contents.get path: 'completed'
all_gists = gh.users.gists username: username

gist_hash = {}
all_gists.each do |gist|
    gist_hash[gist.description] = gist.id
end
puts gist_hash
file_regex = /Problem\d+\.py/
