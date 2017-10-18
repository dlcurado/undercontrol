Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
	get 'central/index'
	
	root 'eventos#index'
  
  	resources :eventos do
  			resources :historicos
  	end
  	
  	resources :clientes do
  		resources :eventos
  	end	
end
