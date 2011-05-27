Abhineetsinghbhamra::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "users/registrations" }

  match "/blogs/archive" => "blogs#archive"
  resources :blogs
  resources :ext_images, :only => [ :create ]

  match "/images/gallery" => "images#gallery", :as => "images_gallery"
  match "/ext_images/gallery" => "ext_images#gallery", :as => "ext_images_gallery"
  resources :images, :except => :show
  match "/images/:file_name" => "images#show"

  match "/art/:file_name" => "images#art", :as => "art"
  match "/ext_art/:id" => "ext_images#art", :as => "ext_art"

  match "homes/social" => "homes#social"
  match "homes/feedback" => "homes#feedback"
  match "homes/about_me" => "homes#about_me"
  match "homes/blog/:id" => "homes#blog", :as => "homes_blog"

  root :to => "homes#index"
end
