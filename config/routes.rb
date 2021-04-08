Rails.application.routes.draw do

  #post
  get "index" => "post#index"
  get "new" => "post#new"
  post "post/create" => "post#create"
  get "post/search" => "post#search"
  get "post/:id/show" => "post#show"
  get "post/:id/edit" => "post#edit"
  post "post/:id/update" => "post#update"
  post "post/:id/destroy" => "post#destroy"

  #home
  get 'home/top'
  get "about" => "home#about"
  
  #user
  get "user/new" => "user#new"
  post "user/create" => "user#create"
  get "login" => "user#login_form"
  post "login" => "user#login"
  post "logout" => "user#logout"
  get "user/:id/show" => "user#show"
  get "user/:id/edit" => "user#edit"
  post "user/:id/update" => "user#update"
  get "user/:id/likes" => "user#likes"
  
  #like
  post "like/:post_id/create" => "like#create"
  post "like/:post_id/destroy" => "like#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
