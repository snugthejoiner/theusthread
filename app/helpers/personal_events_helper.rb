module PersonalEventsHelper

  #formats date as MM/DD/YYYY
  def event_start(personal_event)
    personal_event.starting.strftime('%m/%d/%Y')
  end

  def event_end(personal_event)
    unless personal_event.ending.nil?
      personal_event.ending.strftime('%m/%d/%Y')
    end
  end

  def event_person_birth(personal_event)
    personal_event.person.born.strftime('%m/%d/%Y')
  end

  def event_person_death(personal_event)
    unless personal_event.person.died.nil?
      personal_event.person.died.strftime('%m/%d/%Y')
    end
  end

end
