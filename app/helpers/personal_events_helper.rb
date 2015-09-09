module PersonalEventsHelper
  def personator(personal_event)
    u = URI.parse(request.original_fullpath)
    p = CGI.parse(u.query)
    person_id = p['person_id'].first
  end

  def event_start(personal_event)
    personal_event.starting.strftime('%m/%d/%Y')
  end

end
