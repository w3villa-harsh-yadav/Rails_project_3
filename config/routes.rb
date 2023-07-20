Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'messages#index'
  resources :users,only:[:new,:create]
  resources :sessions,:messages,only: [:create]
  get 'login' , to: 'sessions#new'
  delete 'logout' ,to: 'sessions#destroy'
  
  mount ActionCable.server, at: '/cable'
end
