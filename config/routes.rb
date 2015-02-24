First_Website::Application.routes.draw do
devise_for :users

resources :scenes
resources :nodes
resources :actions
resources :messages
resources :pre_questionnaire
 
root to: 'static_pages#home'

match '/terms', to: 'static_pages#terms', via:'get'
match '/preUseQuestionnaire', to: 'static_pages#preUseQuestionnaire', via:'get'
match '/pre_questionnaire', to: 'pre_questionnaire#create', via:'patch'
match '/tutorial', to: 'scenes#tutorial', via:'get'
match '/tutorial2', to: 'scenes#tutorial2', via:'get'
match '/tutorial3', to: 'scenes#tutorial3', via:'get'
match '/tutorial4', to: 'scenes#tutorial4', via:'get'
match '/tutorial5', to: 'scenes#tutorial5', via:'get'
match '/tutorial6', to: 'scenes#tutorial6', via:'get'
match '/addtofront', to: 'scenes#addtofront', via:'get'
match '/addtofront2', to: 'scenes#addtofront2', via:'get'
match '/addtofront3', to: 'scenes#addtofront3', via:'get'
match '/addtomiddle', to: 'scenes#addtomiddle', via:'get'
match '/addtomiddle2', to: 'scenes#addtomiddle2', via:'get'
match '/addtomiddle3', to: 'scenes#addtomiddle3', via:'get'
match '/addtoback', to: 'scenes#addtoback', via:'get'
match '/addtoback2', to: 'scenes#addtoback2', via:'get'
match '/addtoback3', to: 'scenes#addtoback3', via:'get'
match '/removefromback', to: 'scenes#removefromback', via:'get'
match '/removefromback2', to: 'scenes#removefromback2', via:'get'
match '/removefromback3', to: 'scenes#removefromback3', via:'get'
match '/removefromlist', to: 'scenes#removefromlist', via:'get'
match '/removefromlist2', to: 'scenes#removefromlist2', via:'get'
match '/removefromlist3', to: 'scenes#removefromlist3', via:'get'
match '/removefromfront', to: 'scenes#removefromfront', via:'get'
match '/removefromfront2', to: 'scenes#removefromfront2', via:'get'
match '/removefromfront3', to: 'scenes#removefromfront3', via:'get'
match '/sort', to: 'scenes#sort', via:'get'
match '/sort2', to: 'scenes#sort2', via:'get'
match '/sort3', to: 'scenes#sort3', via:'get'
match '/reverse', to: 'scenes#reverse', via:'get'
match '/reverse2', to: 'scenes#reverse2', via:'get'
match '/reverse3', to: 'scenes#reverse3', via:'get'
match '/nodes/data', to: 'nodes#data', via: 'get'
match '/layouts/show', to: 'layouts#show', via: 'get'
match '/layouts/chat', to: 'layouts#chat', via: 'get'
match '/layouts/_chat', to: 'layouts#chat', via: 'get'
match '/layouts/openchat', to: 'layouts#openchat', via: 'get'
match '/collab', to: 'scenes#add_collab', via: 'get'
match '/acollab', to: 'scenes#accept_inv', via: 'get'
match '/scenes/tutorial', to: 'scenes#update_tutorial', via:'get'


match '/scenes/layouts/chat.js', to: 'scenes#update', via: 'get'
match '/scenes/layouts/show.js', to: 'scenes#update', via: 'get'


mount Ckeditor::Engine => '/ckeditor'


end
