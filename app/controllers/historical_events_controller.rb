class HistoricalEventsController < ApplicationController
  def index
    @historical_events = HistoricalEvent.all
  end
end
