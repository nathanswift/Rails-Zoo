Rails.application.routes.draw do
  root 'zoos#index'

  resources :zoos do
    resources :animals
  end

  resources :animals do #the reason we do this rather than nesting into the zoo do is bc of the routes they create
    resources :comments
  end
end
