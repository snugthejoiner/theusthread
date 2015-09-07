module PersonalEventsHelper
  def personator(personal_event)
    u = URI.parse(request.original_fullpath)
    p = CGI.parse(u.query)
    person_id = p['person_id'].first
  end
end
