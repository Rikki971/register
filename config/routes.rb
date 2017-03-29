Rails.application.routes.draw do
	

resources :users do
	resources :events
	resources :comments
end
resources :sessions
	    
   
 
end
