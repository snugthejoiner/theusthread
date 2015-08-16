require 'rails_helper'

RSpec.describe User, type: :model do
  describe User
    it "is invalid without a username" do
      FactoryGirl.build(:user, username: nil).should_not be_valid
    end
end
