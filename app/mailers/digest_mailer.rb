class DigestMailer < ApplicationMailer

  default from:"no-reply@theusthread.com"

  def digest_email(user)
    @historical_events = HistoricalEvent.monthy
    @user = user
    @people = @user.people
    mail(to: user.email, subject: "This month's events")
  end

  def digest_email_batch
    @user = User.all
    @user.each do |u|
      digest_email(u)
    end
  end

end
