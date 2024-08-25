namespace :database do
  desc 'Create initial data'
  task init: :environment do
    system('rm -rf storage/development') if Rails.env.development?
    system('bundle exec rails db:drop', exception: true)
    system('bundle exec rails db:create', exception: true)
    system('bundle exec rails db:migrate', exception: true)
    system('bundle exec rails db:seed', exception: true)
    system('bundle exec annotate', exception: true) if Rails.env.development?
  end
end
