class HistoricalEventsController < ApplicationController
  # before_filter :require_user # require_user will set the current_user in controllers
  # before_filter :set_current_user

  def index
    if current_user.nil?
      @events = HistoricalEvent.newest
    else
      @events = (HistoricalEvent.all + PersonalEvent.user_people).sort_by { |h| h[:starting] }.reverse!
    end

  end
  
end
