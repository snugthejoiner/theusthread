class UsersController < ApplicationController
  def show
    @people = Person.where(user_id: current_user.id)
  end
end
