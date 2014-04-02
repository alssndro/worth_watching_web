FactoryGirl.define do
  factory(:movie) do
    title { Faker::Commerce.product_name }
    plot  { Faker::Company.catch_phrase }
    cast { "#{Faker::Name.name}, #{Faker::Name.name}, #{Faker::Name.name}"}
    rt_rating (0..100).to_a.sample
    rt_url { "http://rottentomatoes.com/#{title.gsub(/ /, "_").downcase}" }
    imdb_rating (0..10).to_a.sample
    imdb_url { "http://imdb.com/#{title.gsub(/ /, "_").downcase}" }
    metacritic_rating (0..100).to_a.sample
    metacritic_url { "http://metacritic.com/#{title.gsub(/ /, "_").downcase}" }
    director { Faker::Name.name }
    genre { Faker::Lorem.word.capitalize }
    release_date { Faker::Business.credit_card_expiry_date }
    release_type %w{cinema dvd}.sample

    factory :movie_with_reviews do

      ignore do
        reviews_count 5
      end

      after(:create) do |movie, evaluator|
        create_list(:review, evaluator.reviews_count, movie: movie)
      end
    end
  end
end
