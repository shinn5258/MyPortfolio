Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'


  get 'users/index'
  get 'signup' => 'users#add'
  post 'signup' => 'users#create'
  get 'users/edit/:id' => 'users#edit'
  patch 'users/edit/:id' => 'users#edit'
  get 'users/:id' => 'users#show'
 
  get "posts/index" 
  get 'posts/add'
  post 'posts/add' => 'posts#create'
  get 'posts/edit/:id' => 'posts#edit'
  patch 'posts/edit/:id' => 'posts#edit'
  post 'posts/destroy/:id' => 'posts#destroy'
  get 'posts/:id' => 'posts#show'
  
  get '/' => 'home#index'
  get 'about' => 'home#about'

end
