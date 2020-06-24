Rails.application.routes.draw do
  resources :dogs, only: [:index, :show, :edit, :create]
  resources :employees
  # get '/' => :home
end
