FactoryGirl.define do
  factory(:review) do
    author { Faker::Name.name }
    date { Faker::Business.credit_card_expiry_date } # No normal random date method
    rating %w{fresh rotten}.sample
    original_score (0..10).to_a.sample
    source { Faker::Company.name }
    quote { Faker::Lorem.sentence }
    link { Faker::Internet.url }
    movie
  end
end
