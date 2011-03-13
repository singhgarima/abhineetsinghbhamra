Abhineetsinghbhamra::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "users/registrations" }

  match "/blogs/archive" => "blogs#archive"
  resources :blogs

  match "/images/gallery" => "images#gallery", :as => "images_gallery"
  resources :images, :except => :show
  match "/images/:file_name" => "images#show"
  match "/art/:file_name" => "images#art"

  match "homes/gallery" => "homes#gallery"
  match "homes/blog" => "homes#blog"

  root :to => "homes#index"
end
