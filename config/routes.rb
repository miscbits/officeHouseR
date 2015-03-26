OfficeHours::Application.routes.draw do

  get "sessions/new"
  root :to => 'home#index'
  get 'signup'  => 'teachers#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :teachers

end
