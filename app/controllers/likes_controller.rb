class LikesController < ApplicationController

def index
    @like = Like.all
    render json: {like: @like}
end   


def create

event = Event.find(params[:event_id])

if event.blank?
            return render json: {response: 500,msg: "user not found"}
end   

like = event.likes.build(like_params)

#if likable_type == "event"
#@like.likable_id = @event.id
#end
# if likable_type == "comment"
 #    @like.likable_id == @comment.id
 #end
 if like.save!
            render json: {response: 200,msg: "comment Created", like: @like}
        else
            render json: {response: 500,msg: "Event Not Created"}
        end
end

def index_comment

@like = Like.all
render json: {like: @like}

end

#like for comment

def create_comment
comment = Comment.find(params[:comment_id])

if comment.blank?
            return render json: {response: 500,msg: "comment not found"}
end   

like = comment.likes.build(like_params)
#if likable_type == "event"
#@like.likable_id = @event.id
#end
# if likable_type == "comment"
 #    @like.likable_id == @comment.id
 #end
 if like.save!
            render json: {response: 200,msg: "liked", like: @like}
        else
            render json: {response: 500,msg: "cannot like"}
        end
end



 private

    def like_params
      params.require(:like).permit(:status,:user_id)
    end
end
