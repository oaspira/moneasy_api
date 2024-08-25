namespace :base do
  desc 'Creating Entry Types'
  task entry_types: :environment do
    EntryType::KEYS.keys.each do |key|
      EntryType.create!(key:)
    end
  end
end