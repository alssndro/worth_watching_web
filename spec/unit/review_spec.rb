require 'test_helper'

describe "Review" do
  let(:review) { FactoryGirl.create(:review) }

  it "has valid constructor" do
    expect(review).to be_an_instance_of(Review)
  end
end
