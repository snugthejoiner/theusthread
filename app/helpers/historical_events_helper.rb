module HistoricalEventsHelper

    def blurb(historical_event)
      if historical_event.premilestone_status.to_s != ''
        "\n #{historical_event.premilestone_status}"
      elsif historical_event.ongoing_status.to_s != ''
        "\n #{historical_event.ongoing_status}"
      else
        ""
      end
    end

end
