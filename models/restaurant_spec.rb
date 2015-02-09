require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  it "should have a name" do
    restaurant = Restaurant.new(name: "La Tour d'Argent")
    expect(restaurant.name).to eq("La Tour d'Argent")
  end
end
