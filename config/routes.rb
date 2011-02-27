Abhineetsinghbhamra::Application.routes.draw do
  resources :images, :except => :show
  match "/images/:file_name" => "images#show"

  match "homes/gallery" => "homes#gallery"

  root :to => "homes#index"
end
