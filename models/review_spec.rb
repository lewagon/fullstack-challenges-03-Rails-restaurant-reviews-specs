require 'rails_helper'

RSpec.describe Review, :type => :model do
  let(:valid_attribute) do
    {
      content: "This is a great restaurant!",
      rating: 5,
      restaurant_id: restaurant.id
    }
  end
  let(:restaurant) do
    Restaurant.create!({
      name: "La Tour d'Argent",
      address: "15 Quai de la Tournelle, 75005 Paris",
      phone_number: "01 43 54 23 31",
      category: "french"
    })
  end

  it "has a content" do
    review = Review.new(content: "This is a great restaurant")
    expect(review.content).to eq("This is a great restaurant")
  end

  it "has a rating (stored as integer)" do
    review = Review.new(rating: 5)
    expect(review.rating).to eq(5)
  end

  it "content cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:content)
    restaurant = Review.new(attributes)
    expect(restaurant).not_to be_valid
  end

  it "rating cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:rating)
    restaurant = Review.new(attributes)
    expect(restaurant).not_to be_valid
  end

  it "parent restaurant cannot be nil" do
    attributes = valid_attributes
    attributes.delete(:restaurant_id)
    restaurant = Review.new(attributes)
    expect(restaurant).not_to be_valid
  end
end
