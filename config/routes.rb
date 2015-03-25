OfficeHours::Application.routes.draw do

  root :to => 'home#index'
  get 'signup'  => 'teachers#new'
  resources :teachers

end
