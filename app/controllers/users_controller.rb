class UsersController < ApplicationController
	def index
    @users = User.all
    render json: {:user => @users}
  end

  def show
  end


	def new

	end


def create
   user = User.create(user_params)
 
  if user.save!
    render json: {:msg => "response code: 200, response message: successfull", user: user}
  else
      render json: {:article => "response code: 400, response message: Bad request"}
  end
end
def edit
  
end
  
 
 def update
    user = User.find(params[:id])
 
    if user.update(user_params)
        render json: {:msg => article}
    else
       render json:{:msg => "could not be saved"}
    end
  end
  def create_event
	 user = User.find(params[:id])
	 return 
	if user
		 user_events = user.events.build(event_params) 

	else
	 	render json: {responsecode: 500, responsemsg: "User does not exist"}
	end
end
 
  def destroy
    user = User.find(params[:id])
    if user.destroy
                render json: {:user => user}
 
   else
 
      render json: {:msg => "could not be saved"}
    end
  end

private

def user_params
	params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:dob,:mob,:gender,:state,:country)

end
def event_params
		params.require(:event).permit( :event_name, :location, :description)
	end
end
