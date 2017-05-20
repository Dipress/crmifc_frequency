Rails.application.routes.draw do
  devise_for :users

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  root 'devices#index'

  resources :devices, concerns: :paginatable
  resources :base_stations, concerns: :paginatable
end
