class UsersController < ApplicationController
  def show
    @user = User.last
  end
end
