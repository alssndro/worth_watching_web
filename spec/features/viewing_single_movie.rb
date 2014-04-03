require 'test_helper'

describe "Viewing a single movie", :type => :feature do
  it "shows the title of the movie" do
    Movie.all.each do |movie|
      visit("/movies/#{movie.id}")
      puts movie.title
      expect(page).to have_content(movie.title)
    end
  end
end
