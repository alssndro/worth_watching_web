require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

  before do 
    
  end

  get '/' do

    haml :home
  end

end