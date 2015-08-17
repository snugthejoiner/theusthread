require 'rails_helper'

RSpec.describe HistoricalEventsHelper, type: :helper do
  describe "blurb" do
    status = Faker::Lorem.sentence
    it "returns a premilestone_status or ongoing_status if present or an empty string if neither are present" do
      historical_event = HistoricalEvent.new(premilestone_status: status)
      expect(helper.blurb(historical_event)).to eq("\n #{status}")
      historical_event = HistoricalEvent.new(ongoing_status: status)
      expect(helper.blurb(historical_event)).to eq("\n #{status}")
      historical_event = HistoricalEvent.new
      expect(helper.blurb(historical_event)).to eq("")
    end
  end
end
