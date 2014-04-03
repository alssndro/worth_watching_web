require 'test_helper'

describe "Filtering movies by release type", :type => :feature do
  describe "viewing only cinema releases" do
    it "shows only cinema releases" do
      visit("/")
      click_link("Cinema")

      Movie.where(release_type: "cinema").each do |movie|
        expect(page).to have_content(movie.title)
      end
    end
  end

  describe "viewing only DVD releases" do
    it "shows only DVD releases" do
      visit("/")
      click_link("DVD")

      Movie.where(release_type: "dvd").each do |movie|
        expect(page).to have_content(movie.title)
      end
    end
  end
end
