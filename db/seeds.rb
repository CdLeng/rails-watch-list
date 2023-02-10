require 'json'

# db/seeds.rb
puts 'Clearing database..'

Movie.destroy_all

api_key = '7efc57995b34e8c99d1b29640076b8fe'
movies_url = URI.open("https://api.themoviedb.org/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=1").read
movies = JSON.parse(movies_url)['results']
config_url = URI.open("https://api.themoviedb.org/3/configuration?api_key=#{api_key}").read
config_images = JSON.parse(config_url)['images']
images_base_url = config_images['base_url']
poster_size = config_images['poster_sizes'][4]

movies.each do |movie|
  new_movie = Movie.create(title: movie['original_title'],
                           overview: movie['overview'],
                           poster_url: "#{images_base_url}#{poster_size}#{movie["poster_path"]}",
                           rating: movie['vote_average'])
  puts "Creating movie #{new_movie.title} with ID #{new_movie.id}"
end
