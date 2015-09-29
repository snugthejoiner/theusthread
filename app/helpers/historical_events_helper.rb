module HistoricalEventsHelper

  def ongoing(event)
    if event.class.name == "PersonalEvent"
      he = HistoricalEvent.ongoing_started(event.starting).ongoing_unfinished(event.starting).map(&:ongoing_status).join(", ")
    else
      pe = PersonalEvent.personal_started(event.starting).personal_unfinished(event.starting).map(&:description).join(", ")
    end
  end

  def age_of_person(event, person)
    if event.starting > person.born && event.starting < person.died
      "#{person.name} is #{distance_of_time_in_words(event.starting, person.born).sub(/^about /i, "").sub(/^almost /i, "").sub(/^over /i, "")} old"
    else
      nil
    end
  end

  def event_start(event)
    event.starting.strftime('%m/%d/%Y')
  end

  def taglist(event)
    a = event.tags.pluck(:name)
    a.join(", ")
  end

end