Rails.application.routes.draw do
  get "/dogs/sorted_index", to: "dogs#sorted_index", as: "sorted_dogs"
  
  resources :dogs
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
