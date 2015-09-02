class HistoricalEventsController < ApplicationController

  # http://stackoverflow.com/questions/3310947/how-do-i-mix-2-rails-models-into-a-single-find

  def index
    @events = (HistoricalEvent.all + PersonalEvent.all)
  end
  
end
