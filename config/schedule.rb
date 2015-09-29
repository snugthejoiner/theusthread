# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

# every 5.minutes do
  # runner "DigestMailer.digest_email(User.last).deliver_now", :environment => 'development'
# end
# 
every 1.day, :at => '10:00 am' do
  rake "send_monthly"
end

