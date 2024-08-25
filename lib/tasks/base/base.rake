namespace :base do
  task load: :environment do
    puts 'Starting Database Populate'
    Rake::Task['base:entry_categories'].invoke
    Rake::Task['base:entry_statuses'].invoke
    Rake::Task['base:entry_types'].invoke
    Rake::Task['base:users'].invoke
  end
end