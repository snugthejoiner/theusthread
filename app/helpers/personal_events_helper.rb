module PersonalEventsHelper

  def event_start(personal_event)
    personal_event.starting.strftime('%m/%d/%Y')
  end

  

end
