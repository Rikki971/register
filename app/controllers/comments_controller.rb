class CommentsController < ApplicationController


def index
    @comments = Comment.all
    render json: {:comments =>  @comments}
  end

  def show
  end


	def new

	end


def create
  @event = Event.find (params[:event_id])
  if @event.blank?
    return render json:{response: 200,msg: "user not found"}
  end
   @comments = @event.comments.create(comment_params)
 
  if @comments.save
    render json: {:msg => "response code: 200, response message: successfull", comments: @comment}
  else
      render json: {:article => "response code: 400, response message: Bad request"}
  end
end

private
def comment_params
		params.require(:comments).permit( :name, :body,:user_id)
	end

end
