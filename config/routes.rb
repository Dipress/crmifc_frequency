Rails.application.routes.draw do
	concern :paginatable do
		get '(page/:page)', action: :index, on: :collection, as: ''
	end
  root 'devices#index'

  resources :devices, concerns: :paginatable
end
