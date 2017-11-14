Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
	get 'central/index'
	
	root 'eventos#index'
  
  
  	resources :clientes
  	resources :eventos do
  		resources :historicos
  	end
  	
  	resources :historicos
  	resources :locais
  	resources :tipo_eventos
  	
#  	resources :eventos do
#  		resources :historicos
#  	end
#  	
#  	resources :clientes do
#  		resources :eventos
#  	end	
end
