First_Website::Application.routes.draw do
devise_for :users

resources :scenes
resources :nodes
resources :actions
resources :messages
 
root to: 'static_pages#home'

match '/terms', to: 'static_pages#terms', via:'get'
match '/tutorial', to: 'scenes#tutorial', via:'get'
match '/addtofront', to: 'scenes#addtofront', via:'get'
match '/addtomiddle', to: 'scenes#addtomiddle', via:'get'
match '/removefromback', to: 'scenes#removefromback', via:'get'
match '/removefromlist', to: 'scenes#removefromlist', via:'get'
match '/nodes/data', to: 'nodes#data', via: 'get'
match '/layouts/show', to: 'layouts#show', via: 'get'
match '/layouts/openchat', to: 'layouts#openchat', via: 'get'


mount Ckeditor::Engine => '/ckeditor'


end
