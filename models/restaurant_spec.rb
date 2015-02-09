require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  it "has a name" do
    restaurant = Restaurant.new(name: "La Tour d'Argent")
    expect(restaurant.name).to eq("La Tour d'Argent")
  end

  it "has an address" do
    restaurant = Restaurant.new(address: "15 Quai de la Tournelle, 75005 Paris")
    expect(restaurant.address).to eq("15 Quai de la Tournelle, 75005 Paris")
  end

  it "has a phone number" do
    restaurant = Restaurant.new(phone_number: "01 43 54 23 31")
    expect(restaurant.phone_number).to eq("01 43 54 23 31")
  end

  it "has a category" do
    restaurant = Restaurant.new(category: "french")
    expect(restaurant.category).to eq("french")
  end
end
