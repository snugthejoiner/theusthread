class DigestMailer < ApplicationMailer

  def digest_email(user, person)
    @user = user
    @person = person
    mail(to: user.email, subject: "New comment on #{person.name}")
  end

end
