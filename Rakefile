require './fresh_popcorn_app.rb'
require "sinatra/activerecord/rake"

require 'worth_watching'

desc "Update movies"
task :update_movies, [:movie_limit] do |t, args|

  # Default argument
  args.with_defaults(movie_limit: 5)
  
  # Stop ruby buffering stdout printed status string appear immediately
  $stdout.sync = true

  old_movies = Movie.all.to_a

  update_movie_db(:cinema, :box_office, :uk, args.movie_limit)
  puts "Finished updating cinema releases\n"

  update_movie_db(:dvd, :top_rentals, :uk, args.movie_limit)
  puts "Finished updating dvd releases\n"
  #binding.pry

  # Remove old movies
  old_movies.each { |movie| movie.destroy! }
end

  def update_movie_db(release_type, list_name, list_country, result_limit)

    settings = YAML.load_file("config/settings.yaml")

    aggregator = WorthWatching::Aggregator.new(settings["rt_api_key"], settings["tmdb_api_key"])

    movies = aggregator.aggregate_list(list_name, list_country, result_limit)
    puts "Retrieved #{movies.size} movies"

    movies.each do |movie|
      puts "Adding #{movie.title}"
      current_movie = Movie.new
      current_movie.release_type = release_type.to_s
      current_movie.title = movie.title
      current_movie.plot = movie.plot
      current_movie.rt_rating = movie.rt_rating
      current_movie.rt_url = movie.rt_url
      current_movie.imdb_rating = movie.imdb_rating
      current_movie.imdb_url = movie.imdb_url
      current_movie.metacritic_rating = movie.metacritic_rating
      current_movie.metacritic_url = movie.metacritic_url
      current_movie.cast = movie.cast
      current_movie.release_date = movie.release_date
      current_movie.director = movie.director
      current_movie.genre = movie.genre

      current_movie.poster = URI.parse(movie.poster) if movie.poster != "No poster available"

      movie.reviews.each do |review|
        current_movie.reviews.build(review.to_hash)
      end

      update_result = current_movie.save ? "'#{movie.title}' successully added" : "#{movie.title} failed"
      puts update_result
    end
  end
