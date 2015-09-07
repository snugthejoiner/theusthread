class PersonalEventsController < ApplicationController
  before_filter :require_user # require_user will set the current_user in controllers
  before_filter :set_current_user

  def index
    @personal_events = PersonalEvent.all
  end

  def show
    @personal_event = PersonalEvent.find(params[:id])
  end

  def new
    @personal_event = PersonalEvent.new
  end

  def create
    @personal_event = PersonalEvent.new(params.require(:personal_event).permit(:description, :ending, :starting, :private))
     if @personal_event.save
       flash[:notice] = "Your event was saved."
       redirect_to @personal_event
     else
       flash[:error] = "There was an error saving your event. Please try again."
       render :new
     end
  end

  def edit
    @personal_event = PersonalEvent.find(params[:id])
  end

  def update
    @personal_event = PersonalEvent.find(params[:id])
     if @personal_event.update_attributes(params.require(:personal_event).permit(:description, :ending, :starting, :private))
       flash[:notice] = "Your event was updated."
       redirect_to @personal_event
     else
       flash[:error] = "There was an error saving changes to your event. Please try again."
       render :new
     end
  end

  def destroy
  end
end
