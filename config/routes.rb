First_Website::Application.routes.draw do
devise_for :users
 
root to: 'static_pages#home'

match '/terms', to: 'static_pages#terms', via:'get'

mount Ckeditor::Engine => '/ckeditor'


end
