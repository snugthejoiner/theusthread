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
    it "renders the show template" do
      get :show, id:@personal_event
      response.should render_template("show")
      response.body.should == ""
    end

  end

  describe "GET #new" do
    it "returns http success" do
      get :new, person_id:@person.id
      expect(response.status).to eq(200)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id:@personal_event
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "user is signed in" do

      it "returns proper path & flash, does save for a valid personal_event" do
        personal_event_count = PersonalEvent.count
        post :create, personal_event: {person_id: @person.id}

        expect(PersonalEvent.count).to eq(personal_event_count + 1)
        expect(flash["notice"]).to eq("Your event was saved.")
        expect(flash["errors"]).to be_nil
        expect(PersonalEvent.count).to_not eq(personal_event_count)
      end
    end
  end

  describe "POST #update" do
    it "valid params" do
      @person = FactoryGirl.create(:person, user_id: @user.id, name: "Laura Vandervoort")
      @personal_event = FactoryGirl.create(:personal_event, person_id: @person.id)
      post :update, id: @personal_event.id, personal_event: {description: "MyNewString"}, format: :json
      expect(flash["notice"]).to eq("Your event was updated.")
      expect(@personal_event.reload.description.to_s).to include("MyNewString")
      expect(@personal_event.reload.starting).to eq("2015-08-20")
    end
  end 

  describe "GET #destroy" do
    it "destroys the personal_event" do
      expect {
        delete :destroy, id: @personal_event
      }.to change(PersonalEvent, :count).by(-1)
    end

    it "redirects to the person#show view" do
      delete :destroy, id: @personal_event
      response.should redirect_to(@personal_event.person)
    end

  end

end