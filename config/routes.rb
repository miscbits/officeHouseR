OfficeHours::Application.routes.draw do

  root :to => 'home#index'
  get    'teachers'         => 'teachers#all'
  get    'search'           => 'home#searchResults'
  get    'profile'          => 'teachers#show'
  get    'signup'           => 'teachers#new'
  get    'login'            => 'sessions#new'
  post   'login'            => 'sessions#create'
  delete 'logout'           => 'sessions#destroy'
  get    'availability/new' => 'teachers#avail'
  get    'course/new'       => 'teachers#course'
  resources :teachers
  resources :availabilities,    only: [:create, :destroy]
  resources :courses,           only: [:create, :destroy]
end
