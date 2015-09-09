require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PersonalEventsHelper. For example:
#
# describe PersonalEventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PersonalEventsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "event_start" do
    it "returns the start date of an event formatted as MM/DD/YYYY" do
      event = PersonalEvent.new
      expect(helper.event_start(event)).to eq("08/20/2015")
    end
  end
end
