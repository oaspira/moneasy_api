namespace :base do
  desc 'Creating Users'
  task users: :environment do
    User.create!(
      first_name: 'teste',
      last_name: 'teste',
      email: 'teste@teste.com',
      password: '@Teste123'
    )
  end
end
