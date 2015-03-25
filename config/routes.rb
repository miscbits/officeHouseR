OfficeHours::Application.routes.draw do

  root :to => 'home#index'
  get 'signup'  => 'users#new'
  resources :teachers

end
