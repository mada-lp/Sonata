Rails.application.routes.draw do
  root "documents#index"
  resources :documents, only: [:new, :create, :show]

  get 'new', to: 'documents#_new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
