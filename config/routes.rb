# config/routes/routes.rb

Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
    end
  end
end
