class PeopleController < ApplicationController

  def show
    @person = Person.find(params[:id])
    @personal_events = PersonalEvent.where(person_id: @person.id)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params.require(:person).permit(:name, :born, :died, :user_id))
    if @person.save
       flash[:notice] = "Your new Person's info has been saved."
       redirect_to @person
    elsif @person.invalid?
       flash[:alert] = "You must enter a name and a date of birth."
       redirect_to new_person_path(user_id: current_user.id)
    else
       flash[:alert] = "There was an error saving your person. Please try again."
       redirect_to new_person_path(user_id: current_user.id)
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params.require(:person).permit(:name, :born, :died))
      flash[:notice] = "Your person was updated."
      redirect_to @person
    elsif @person.invalid?
      flash[:alert] = "A person must have a name and a date of birth."
      redirect_to new_person_path(user_id: current_user.id)
    else
      flash[:alert] = "There was an error saving changes to your Person. Please try again."
      redirect_to edit_person_path(user_id: current_user.id)
    end
  end

  def destroy
    @person = Person.find(params[:id])
     if @person.destroy
       flash[:notice] = "Your person was deleted."
       redirect_to users_show_path
     else
       flash[:alert] = "There was an error saving changes to your person. Please try again."
       render :new
     end
  end
end
