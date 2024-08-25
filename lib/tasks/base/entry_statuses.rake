namespace :base do
  desc 'Creating Entry Statuses'
  task entry_statuses: :environment do
    EntryStatus::KEYS.keys.each do |key|
      EntryStatus.create!(key:)
    end
  end
end