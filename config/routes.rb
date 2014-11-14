First_Website::Application.routes.draw do
devise_for :users

resources :scenes
resources :nodes
resources :actions
 
root to: 'static_pages#home'

match '/terms', to: 'static_pages#terms', via:'get'
match '/nodes/data', to: 'nodes#data', via: 'get'

mount Ckeditor::Engine => '/ckeditor'


end
