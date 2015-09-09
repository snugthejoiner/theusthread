require 'rails_helper'

RSpec.describe PersonalEventsController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @person = FactoryGirl.create(:person, user_id: @user.id)
    @personal_event = FactoryGirl.create(:personal_event, person_id: @person.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @personal_event
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id:@personal_event
      expect(response.status).to eq(200)
    end
  end

  # describe "GET #destroy" do
    # it "returns http success" do
      # get :destroy
      # expect(response).to have_http_status(:success)
    # end
  # end

end