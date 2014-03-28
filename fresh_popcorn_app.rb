require 'sinatra/base'
require 'pry'

class FreshPopcornApp < Sinatra::Base

  before do

  end

  get '/' do

    haml :home
  end

end
