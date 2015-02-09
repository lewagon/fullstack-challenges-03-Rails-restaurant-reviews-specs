require "rails_helper"

begin
  require "restaurants_controller"
rescue LoadError
end

if defined?(RestaurantsController)

  RSpec.describe RestaurantsController, :type => :routing do
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/restaurants").to route_to("restaurants#index")
      end

      it "routes to #new" do
        expect(:get => "/restaurants/new").to route_to("restaurants#new")
      end

      it "routes to #show" do
        expect(:get => "/restaurants/1").to route_to("restaurants#show", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/restaurants").to route_to("restaurants#create")
      end

    end
  end

end