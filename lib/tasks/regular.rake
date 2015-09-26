task :send_monthly => :environment do
  users = User.subscribed
  users.each do |user| 
    DigestMailer.digest_email(user).deliver_now
  end
end