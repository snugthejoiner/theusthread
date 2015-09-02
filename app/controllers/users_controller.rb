class UsersController < ApplicationController
  def show
    @user = User.last
    @people = Person.where(user_id: @user.id)
  end
end
