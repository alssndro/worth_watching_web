require 'test_helper'

describe "Viewing the homepage", :type => :feature do
  it "shows the title of every movie" do
    visit('/')

    Movie.all.each do |movie|
      expect(page).to have_content(movie.title)
    end
  end
end
