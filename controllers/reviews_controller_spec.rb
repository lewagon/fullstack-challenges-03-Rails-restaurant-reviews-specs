require 'rails_helper'
begin
  require "reviews_controller"
rescue LoadError
end

if defined?(ReviewsController)
  RSpec.describe ReviewsController, :type => :controller do

    before(:each) do
      @restaurant = Restaurant.create!({
        name: "La Tour d'Argent",
        address: "15 Quai de la Tournelle, 75005 Paris",
        phone_number: "01 43 54 23 31",
        category: "french"
      })
    end

    let(:valid_attributes) do
      {
        content: "Great!",
        rating: 5,
        restaurant_id: 1
      }
    end

    let(:invalid_attributes) do
      { content: "" }
    end

    let(:valid_session) { {} }

    describe "GET new" do
      it "assigns a new review as @review" do
        get :new, { restaurant_id: @restaurant.id }, valid_session
        expect(assigns(:restaurant)).to eq(@restaurant)
        expect(assigns(:review)).to be_a_new(Review)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Review" do
          expect {
            post :create, { restaurant_id: @restaurant.id, :review => valid_attributes}, valid_session
          }.to change(Review, :count).by(1)
        end

        it "assigns a newly created review as @review" do
          post :create, { restaurant_id: @restaurant.id, :review => valid_attributes}, valid_session
          expect(assigns(:review)).to be_a(Review)
          expect(assigns(:review)).to be_persisted
        end

        it "redirects to the parent restaurant" do
          post :create, { restaurant_id: @restaurant.id, :review => valid_attributes}, valid_session
          expect(response).to redirect_to(@restaurant)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved review as @review" do
          post :create, { restaurant_id: @restaurant.id, :review => invalid_attributes}, valid_session
          expect(assigns(:review)).to be_a_new(Review)
        end

        it "re-renders the 'new' template" do
          post :create, { restaurant_id: @restaurant.id, :review => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end

else
  describe "ReviewsController" do
    it "should exist" do
      expect(defined?(ReviewsController)).to eq(true)
    end
  end
end
