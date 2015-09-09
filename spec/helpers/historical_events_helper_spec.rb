require 'rails_helper'

RSpec.describe HistoricalEventsHelper, type: :helper do
  describe "blurb" do
    status = Faker::Lorem.sentence
    it "returns a premilestone_status or ongoing_status if present or nil if neither are present" do
      event = HistoricalEvent.new(premilestone_status: status)
      expect(helper.blurb(event)).to eq("\n #{status}")
      event = HistoricalEvent.new(ongoing_status: status)
      expect(helper.blurb(event)).to eq("\n #{status}")
      event = HistoricalEvent.new
      expect(helper.blurb(event)).to be_nil
    end
  end

  describe "summary" do
    it "returns the name of the Person and the description for PersonalEvents and just the event description for HistorcalEvents" do
      event = HistoricalEvent.new
      expect(helper.summary(event)).to eq(event.description)
      pevent = PersonalEvent.new
      expect(helper.summary(pevent)).to eq(pevent.description)
    end
  end

end
