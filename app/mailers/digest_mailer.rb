class DigestMailer < ApplicationMailer

  default from:"no-reply@theusthread.com"

  def digest_email(user_email,user_username,user_people)
    @historical_events = HistoricalEvent.monthy
    @people = user_people
    @username = user_username
    mail(to: user_email, subject: "This month's events")
  end

  def digest_email_batch
    @users = User.all
    @users.each do |user|
      digest_email(user.email,user.username,user.people)
    end
  end

end
