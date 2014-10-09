First_Website::Application.routes.draw do
devise_for :users
 
root to: 'static_pages#home'

mount Ckeditor::Engine => '/ckeditor'


end
