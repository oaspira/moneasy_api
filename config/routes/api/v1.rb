namespace :v1 do
  resources :entry_categories, only: [:index, :show, :create, :update, :destroy]
  resources :entry_statuses, only: [:index, :show]
  resources :entry_types, only: [:index, :show, :create, :update, :destroy]
  resources :entries, only: [:index, :show, :create, :update, :destroy]
  resources :monthly_budgets do
    collection do
      get :dashboard
    end
    member do
      get :totals
    end
  end
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :yearly_budgets, only: [:index, :show, :create, :update, :destroy]
end