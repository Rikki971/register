Rails.application.routes.draw do

		#get 'signup', to: 'users#new', as: 'signup'
		post 'signup', to: 'users#create'
	    #get 'login', to: 'sessions#new', as:'signin'
	    post 'login', to: 'sessions#create'
	    post 'EventCreate', to: 'events#create' 


	    match "events_like/:event_id" => "likes#create", :via => 'post'
	    match "events_like/:event_id" =>  "likes#index", :via => 'get'
	    match "comments_like/:comment_id" => "likes#create_comment", :via => 'post'
	    match "comments_like/:comment_id" => "likes#index_comment", :via => 'get'


	resources :users do 
		resources :events do
			resources :comments
		end
			
	end
	resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end