Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'zaloguj', to: 'devise/sessions#new'
  end
  get '/tablica' => "high_voltage/pages#show", id: 'tablica', :as => :user_root

  resources :referees, path: 'sedziowie'
  resources :instructors, path: 'instruktorzy'
  resources :unifications, path: 'unifikacje'
  get 'edycje/zglos', to: 'edition_applies#new'
  scope 'sezon/:year', as: :season do
    resources :edition_applies, path: 'edycje'
  end
  get 'puchar', to: 'high_voltage/pages#show', id: 'puchar'
  get 'sezon/2020/klasyfikacja', to: 'high_voltage/pages#show', id: 'puchar_2020'
  get 'kalendarz' => "high_voltage/pages#show", id: 'kalendarz'
end
