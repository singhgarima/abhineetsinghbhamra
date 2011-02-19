Abhineetsinghbhamra::Application.routes.draw do
  resources :images
  
  match "homes/gallery" => "homes#gallery"

  root :to => "homes#index"
end
