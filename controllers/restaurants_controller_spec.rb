require 'rails_helper'
begin
  require "restaurants_controller"
rescue LoadError
end

if defined?(RestaurantsController)
  RSpec.describe RestaurantsController, :type => :controller do

    let(:valid_attributes) do
      {
        name: "La Tour d'Argent",
        address: "15 Quai de la Tournelle, 75005 Paris",
        phone_number: "01 43 54 23 31",
        category: "french"
      }
    end

    let(:invalid_attributes) do
      { name: "" }
    end

    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all restaurants as @restaurants" do
        restaurant = Restaurant.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:restaurants)).to eq([restaurant])
      end
    end

    describe "GET show" do
      it "assigns the requested restaurant as @restaurant" do
        restaurant = Restaurant.create! valid_attributes
        get :show, {:id => restaurant.to_param}, valid_session
        expect(assigns(:restaurant)).to eq(restaurant)
      end
    end

    describe "GET new" do
      it "assigns a new restaurant as @restaurant" do
        get :new, {}, valid_session
        expect(assigns(:restaurant)).to be_a_new(Restaurant)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Restaurant" do
          expect {
            post :create, {:restaurant => valid_attributes}, valid_session
          }.to change(Restaurant, :count).by(1)
        end

        it "assigns a newly created restaurant as @restaurant" do
          post :create, {:restaurant => valid_attributes}, valid_session
          expect(assigns(:restaurant)).to be_a(Restaurant)
          expect(assigns(:restaurant)).to be_persisted
        end

        it "redirects to the created restaurant" do
          post :create, {:restaurant => valid_attributes}, valid_session
          expect(response).to redirect_to(Restaurant.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved restaurant as @restaurant" do
          post :create, {:restaurant => invalid_attributes}, valid_session
          expect(assigns(:restaurant)).to be_a_new(Restaurant)
        end

        it "re-renders the 'new' template" do
          post :create, {:restaurant => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end

else
  describe "RestaurantsController" do
    it "should exist" do
      expect(defined?(RestaurantsController)).to eq(true)
    end
  end
end