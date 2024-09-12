# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins "example.com"
#
#     resource "*",
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end


Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Aceitar requisições de qualquer origem. Você pode definir domínios específicos como 'https://meusite.com'
      
      resource '*',
        headers: :any, # Permite qualquer cabeçalho
        methods: [:get, :post, :put, :patch, :delete, :options, :head], # Métodos HTTP permitidos
        credentials: false # Definir como true se precisar permitir cookies e credenciais
    end
  end
  