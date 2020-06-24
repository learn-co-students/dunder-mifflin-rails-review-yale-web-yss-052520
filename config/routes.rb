Rails.application.routes.draw do
  resources :dogs
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dogs/sort', to: "dogs#sort"
   post '/dogs/sort', to: "dogs#sort"
end
