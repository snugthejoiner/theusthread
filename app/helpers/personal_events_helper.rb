module PersonalEventsHelper

  #formats date as MM/DD/YYYY
  def event_start(personal_event)
    personal_event.starting.strftime('%m/%d/%Y')
  end

  def personal_summary(personal_event)
    "#{personal_event.person.name} #{personal_event.description.downcase} "
  end 

end
