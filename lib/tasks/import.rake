require 'csv'

namespace :import do
  
  task presidents: :environment do
    filename = File.join Rails.root, "presidents.csv"
    counter = 0

    CSV.foreach(filename, headers: true)do |row|
    historical_event = HistoricalEvent.create(description: row["description"], starting: row["starting"], ending: row["ending"], ongoing_status: row["ongoing_status"])
    puts "#{description} - #{historical_event.errors.full_messages.join(",")}" if historical_event.errors.any?
    counter += 1 if historical_event.persisted?     
    end

    puts "Imported #{counter} historical_events"
  end
end