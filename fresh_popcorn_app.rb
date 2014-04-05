require 'sinatra/base'
require 'sinatra/activerecord'

require './models/movie'
require './models/review'

class FreshPopcornApp < Sinatra::Base

  configure do
    db = URI.parse(ENV["DATABASE_URL"] || "postgres://localhost/fresh_popcorn_#{environment}")

    ActiveRecord::Base.establish_connection(
        :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
        :host     => db.host,
        :username => db.user,
        :password => db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8')
  end

  get '/' do
    # Want cinema releases first
    @movies = Movie.where(release_type: "cinema") + Movie.where(release_type: "dvd")
    haml :home
  end

  get '/movies/:id' do
    @movie = Movie.find(params[:id])
    haml :single_movie
  end
end
