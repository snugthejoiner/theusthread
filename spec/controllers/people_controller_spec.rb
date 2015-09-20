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

  describe "POST #create" do
    context "user is signed in" do

      it "a valid person returns proper path & flash, does save" do
        person_count = Person.count
        post :create, person: {name: "Dean Cain", born: "1966-07-31", user: @user.id}

        expect(Person.count).to eq(person_count + 1)
        expect(flash["notice"]).to eq("Your new Person's info has been saved.")
        expect(flash["errors"]).to be_nil
        expect(Person.count).to_not eq(person_count)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @person
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update" do
    it "valid params" do
      @person = FactoryGirl.create(:person, user_id: @user.id, name: "Laura Vandervoort")
      post :update, id: @person.id, person: {born: "1984-09-22"}, format: :json

      expect(flash[:notice]).to be_present
      expect(@person.reload.born.to_s).to include("1984-09-22")
      expect(@person.reload.name).to eq("Laura Vandervoort")
    end
  end

  describe "DESTROY" do
    it "destroys the person" do
      expect {
        delete :destroy, id: @person
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the users#show view" do
      delete :destroy, id: @person
      response.should redirect_to(users_show_path)
    end
  end

end
