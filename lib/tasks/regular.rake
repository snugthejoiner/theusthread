task :pick_winner => :environment do
  DigestMailer.digest_email(User.last,Person.last).deliver_now
end