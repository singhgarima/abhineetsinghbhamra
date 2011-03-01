Abhineetsinghbhamra::Application.routes.draw do
  match "/images/gallery" => "images#gallery", :as => "images_gallery"
  resources :images, :except => :show
  match "/images/:file_name" => "images#show"

  match "homes/gallery" => "homes#gallery"

  root :to => "homes#index"
end
