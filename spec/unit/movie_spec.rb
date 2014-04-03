require 'test_helper'

describe "Movie" do
  let(:movie) { FactoryGirl.create(:movie_with_reviews) }

  it "has a valid constructor" do
    expect(movie).to be_an_instance_of(Movie)
  end

  it "has multiple reviews" do
    expect(movie.reviews.size).to be > 0
  end

  it "calculates the average review rating" do
    movie = FactoryGirl.create(:movie, rt_rating: 50,
                                       imdb_rating: 6,
                                       metacritic_rating: 70)

    expect(movie.average_rating).to eq(6.0)
  end
end
