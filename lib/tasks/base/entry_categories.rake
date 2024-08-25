namespace :base do
  desc 'Creating Entry Categories'
  task entry_categories: :environment do
    ['Moradia',
    'Alimentação',
    'Transporte',
    'Saúde',
    'Educação',
    'Lazer e Entretenimento',
    'Assinaturas de streaming (Netflix, Spotify, etc.)',
    'Seguros e Proteções',
    'Vestuário e Acessórios',
    'Despesas Pessoais',
    'Impostos e Taxas',
    'Dívidas e Empréstimos',
    'Economias e Investimentos',
    'Contribuições para a aposentadoria',
    'Filhos e Família',
    'Animais de Estimação'].each do |entry_category|
      EntryCategory.create!(description: entry_category)
    end
  end
end