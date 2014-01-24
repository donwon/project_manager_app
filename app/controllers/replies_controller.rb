class RepliesController < ApplicationController

def create
  @replies = Reply.new params.require(:reply).permit(:body)
  @discussion = Discussion.find(params[:discussion_id])
  @replies.discussion = @discussion
  if @replies.save
    redirect_to @discussion, notice:"Thanks"
  else
    #render "discussions/show"
    redirect_to @discussion, alert: "Error, replies cannot be empty"
  end
end

end
