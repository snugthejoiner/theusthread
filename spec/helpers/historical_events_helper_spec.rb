require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HistoricalEventsHelper. For example:
#
# describe HistoricalEventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe HistoricalEventsHelper, type: :helper do
  describe "blurb" do
    it "returns a premilestone_status or ongoing_status if present or an empty string if neither are present" do
      historical_event = HistoricalEvent.new(premilestone_status: 'the wheel has not been invented')
        expect(historical_event.blurb).to match /the wheel has not been invented/
      end
    end
end
