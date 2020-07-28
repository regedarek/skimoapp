Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'zaloguj', to: 'devise/sessions#new'
  end
  get '/tablica' => "high_voltage/pages#show", id: 'tablica', :as => :user_root

  resources :referees, path: 'sedziowie'
  get 'puchar', to: 'high_voltage/pages#show', id: 'puchar'
end
