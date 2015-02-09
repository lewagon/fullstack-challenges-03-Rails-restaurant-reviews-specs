require "rails_helper"

begin
  require "reviews_controller"
rescue LoadError
end

if defined?(ReviewsController)

  RSpec.describe ReviewsController, :type => :routing do
    describe "routing" do

      it "routes to #new" do
        expect(:get => "/restaurants/1/reviews/new").to route_to(controller: "reviews", action: "new", restaurant_id: "1")
      end

      it "routes to #create" do
        expect(:post => "/restaurants/1/reviews").to route_to(controller: "reviews", action: "create", restaurant_id: "1")
      end

    end
  end

end