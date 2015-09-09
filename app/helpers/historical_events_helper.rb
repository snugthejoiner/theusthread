module HistoricalEventsHelper

  def summary(event)
    if event.class.name == "PersonalEvent
      " #{event.person.name} #{event.description.downcase}"
    else
      event.description
    end
  end 

  def blurb(event)
    if event.class.name == "PersonalEvent"
    # something interesting
    elsif event.respond_to?(:premilestone_status) && event.premilestone_status.to_s != ''
      "\n #{event.premilestone_status}"
    elsif event.respond_to?(:premilestone_status) && event.ongoing_status.to_s != ''
      "\n #{event.ongoing_status}"
    else
      nil
    end
  end

  def age_of_person(event, person)
    if event.starting > person.born
      "#{person.name} is #{distance_of_time_in_words(event.starting, person.born).sub(/^about /i, "").sub(/^almost /i, "").sub(/^over /i, "")} old"
    else
      nil
    end
  end

  def event_start(event)
    event.starting.strftime('%m/%d/%Y')
  end

end
