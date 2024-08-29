# config/routes/routes.rb

Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    draw(:'api/v1')
  end
end
