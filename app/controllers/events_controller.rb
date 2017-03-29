class EventsController < ApplicationController

def create
		user = User.find_by(params[:user_id])
		 if user.blank?
			return render json: {response: 500,msg: "user not found"}
		end

		user_events = Event.create(event_params) 
		if user_events.save!
			render json: {response: 500,msg: "Event Created", events: user_events}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
	end


	def index
		@user = User.find(params[:user_id])
		@events=@user.events.all 
			render json: {:event => @events}
	end
	
 def update
 	user = User.find_by(params[:user_id])
    @event = user.events.find(params[:id])
    if @event.update(event_params[:id])
               render json: {response: 500,msg: "Event update", events: @event}
 
   else
 
     render json: {response: 400,msg: "Event Not update"}
  end
end
def destroy
    event = Event.find(params[:id])
    if event.destroy
                render json: {:event => event}
 
   else
 
      render json: {:msg => "could not be del"}
    end
  end



private 

def event_params
			params.require(:event).permit(:event_name,:location,:description,:user_id)

end

end

