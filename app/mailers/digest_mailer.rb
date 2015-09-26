class DigestMailer < ApplicationMailer

  def digest_email(user)
    @url = 'http://theusthread.com/historical_events'
    @user = user
    @historical_events = HistoricalEvent.all.newest.monthy
    @people = @user.people
    message_params = {:from    => 'no-reply@theusthread.com',
                        :to      =>  user.email,
                        :subject => 'This month\'s events'}

    mail(message_params)
  end

end
