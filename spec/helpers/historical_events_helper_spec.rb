require 'rails_helper'

RSpec.describe HistoricalEventsHelper, type: :helper do
  describe "blurb" do
    it "returns a premilestone_status or ongoing_status if present or an empty string if neither are present" do
      historical_event = HistoricalEvent.new(premilestone_status: 'the wheel has not been invented')
      expect(helper.blurb(historical_event)).to eq("\n the wheel has not been invented")
      historical_event = HistoricalEvent.new(ongoing_status: 'grass is still green')
      expect(helper.blurb(historical_event)).to eq("\n grass is still green")
      historical_event = HistoricalEvent.new
      expect(helper.blurb(historical_event)).to eq("")
    end
  end
end
