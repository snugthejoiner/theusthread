class DigestMailer < ApplicationMailer

  default from:"no-reply@theusthread.com"

  def digest_email(user)
    @historical_events = HistoricalEvent.monthy
    @user = user
    @user.people.each do |p|
      binding.pry
      pes = PersonalEvent.where(person_id: p.id).personal_monthy
      @personal_event << pes
    end
    mail(to: user.email, subject: "This month's events")
  end

end
