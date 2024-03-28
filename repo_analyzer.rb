require 'httparty'
require 'json'

def fetch_repositories(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")
  if response.success?
    JSON.parse(response.body)
  end
end

def display(repository)
  puts " The most starred repository is ..."
  puts "Name: #{repository['name']}"
  puts "Description: #{repository['description']}"
  puts "Number of stars: #{repository['star_count']}"
  puts "URL of most starred repo : #{repository['html_url']}"
end

username = 'AlissaMartini'
repositories = fetch_repositories(username)
most_starred_repo = repositories.max_by { |repo| repo['star_count'].to_i }
display(most_starred_repo)

