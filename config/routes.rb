Rails.application.routes.draw do
  root "documents#index"
  resources :documents, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
