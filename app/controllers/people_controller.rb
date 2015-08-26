class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params.require(:person).permit(:name, :born, :died, :user_id))
     if @person.save
       flash[:notice] = "Your new person's info has been saved."
       redirect_to @person
     else
       flash[:error] = "There was an error saving your person. Please try again."
       render :new
     end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
     if @person.update_attributes(params.require(:person).permit(:name, :born, :died))
       flash[:notice] = "Your event was updated."
       redirect_to @person
     else
       flash[:error] = "There was an error saving changes to your Person. Please try again."
       render :new
     end
  end

  def destroy
  end
end
