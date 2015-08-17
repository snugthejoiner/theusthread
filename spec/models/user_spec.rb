require 'rails_helper'

RSpec.describe User, type: :model do
  describe User
    it "is invalid without an email" do
      FactoryGirl.build(:user, email: nil).should_not be_valid
    end
    it "is invalid without a password" do
      FactoryGirl.build(:user, password: nil).should_not be_valid
    end
end
