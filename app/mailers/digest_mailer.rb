class DigestMailer < ApplicationMailer

  default from:"no-reply@theusthread.com"

  def digest_email(user)
    @historical_events = HistoricalEvent.monthy
    @user = user
    @people = @user.people
    mail(to: user.email, subject: "This month's events")
  end

  def digest_email_2(user)
    @events = HistoricalEvent.monthy
    @user = user
    @people = @user.people
    mail(to: user.email, subject: "This month's events")
  end

end
