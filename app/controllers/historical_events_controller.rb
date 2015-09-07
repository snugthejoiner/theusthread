class HistoricalEventsController < ApplicationController

  # http://stackoverflow.com/questions/3310947/how-do-i-mix-2-rails-models-into-a-single-find

  def index
    @events = (HistoricalEvent.all + PersonalEvent.user_people).sort_by { |h| h[:starting] }.reverse!
  end
  
end
