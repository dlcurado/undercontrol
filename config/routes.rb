Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
	get 'central/index'
	
	root 'central#index'
  
  	resources :clientes do
  		resources :historicos
  	end
end
