Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users

  root  'home#index'
  
  get   'post/index'         => 'post#index',        as: :post  

  get   'post/create'        => 'post#create',       as: :create
  post  'post/create_post'   => 'post#create_post',  as: :create_post

  get   'post/one'           => 'post#one',          as: :one

  post  'post/new_comment'   => 'post#new_comment',  as: :new_comment

  post  'comment_search/find'  => 'comment_search#find', as: :find 
  post  'comment_search/find_author' => 'comment_search#find_author', as: :find_author

  get   'post/edit_post'       => 'post#edit_post',    as: :edit_post
  patch 'post/edit_post'       => 'post#update_post'

  get   'post/edit_comment'       => 'post#edit_comment',    as: :edit_comment
  patch 'post/edit_comment'       => 'post#update_comment'

  delete 'post/index'        =>  'post#destroy',     as: :remove_post

  get 'photos/new'          => 'photos#new',      as: :new_photos
  post 'photos/add_pix'     => 'photos#add_pix'

  #resources :post

end
