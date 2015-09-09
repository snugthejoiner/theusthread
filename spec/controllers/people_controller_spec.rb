require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @person = FactoryGirl.create(:person, user_id: @user.id)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @person
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, person: @person
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @person
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update, id: @person
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #destroy" do
    # it "returns http success" do
      # get :destroy
      # expect(response).to have_http_status(:success)
    # end
  # end

end
