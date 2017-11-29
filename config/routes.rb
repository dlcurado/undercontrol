Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
	get 'central/index'
	
	root 'central#index'
  
  	resources :central
  	
  	resources :clientes do
  		resources :eventos
  	end
  	
  	resources :eventos do
  		resources :historicos
  	end
  	
  	resources :historicos
  	resources :locals
  	resources :tipo_eventos
  	
#  	resources :eventos do
#  		resources :historicos
#  	end
#  	
#  	resources :clientes do
#  		resources :eventos
#  	end	
end
