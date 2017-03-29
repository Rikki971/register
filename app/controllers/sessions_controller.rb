class SessionsController < ApplicationController
	 def new

  end
 
def create
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
		#session[:user_id] = user.id
		render json: {:article => "response code: 200, response message: Successfull"}
	else
		flash.now.alert = "email or password is invalid"
		render json: {:article => "response code: 400, response message: Bad Request"}
	end
end 

def destroy
	session[:user_id] = nil
	redirect_to users_url, notice: 'logged out'
 
end
end

