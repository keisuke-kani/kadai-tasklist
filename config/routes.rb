Rails.application.routes.draw do
  root to: 'tasks#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create]
  resources :tasks
end




__END__

  root to: 'tasks#index'
  get 'new_task', to: 'tasks#new'
  get 'tasks', to: 'tasks#index'
  get 'task/:id', to: 'tasks#show'
  get 'task/:id/edit', to: 'tasks#edit'


  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :task
  resources :users, only: [:index, :show, :new, :create]
  resources :tasks, only: [:create, :destroy]
