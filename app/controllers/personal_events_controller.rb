class PersonalEventsController < ApplicationController
  # before_filter :require_user # require_user will set the current_user in controllers
  before_filter :set_current_user

  def index
    @personal_events = PersonalEvent.user_people
  end

  def show
    @personal_event = PersonalEvent.find(params[:id])
  end

  def new
    @person = Person.find(params[:person_id])
    @personal_event = @person.personal_events.build
    @personal_events = @person.personal_events.all
  end

  def create
    @person = Person.find(params[:personal_event][:person_id])
    @personal_event = @person.personal_events.build(params.require(:personal_event).permit(:description, :ending, :starting, :person_id, :private))
     if @personal_event.save
       flash[:notice] = "Your event was saved."
       redirect_to @person
     else
       flash[:error] = "There was an error saving your event. Please try again."
       render :new
     end
  end

  def edit
    @personal_event = PersonalEvent.find(params[:id])
    @tags = Tag.select("Distinct name")
  end

  def update
    @personal_event = PersonalEvent.find(params[:id])
     if @personal_event.update_attributes(params.require(:personal_event).permit(:description, :ending, :starting, :person_id, :private))
       flash[:notice] = "Your event was updated."
       redirect_to @personal_event.person
     else
       flash[:error] = "There was an error saving changes to your event. Please try again."
       render :new
     end
  end

  def destroy
    @personal_event = PersonalEvent.find(params[:id])
    @personal_event.destroy
    if @personal_event.destroy
      flash[:notice] = "This event has been removed"
      redirect_to @personal_event.person
    else
      flash[:error] = "There was an error."
      render :show
    end
  end
end
