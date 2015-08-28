require 'rails_helper'

RSpec.describe HistoricalEvent, type: :model do
  historical_event = HistoricalEvent.create(starting: '1919/1/1')
  
  it "formats the start date of an event as mm/dd/yyyy" do
    expect(historical_event.event_start).to eq("01/01/1919")
  end
end
