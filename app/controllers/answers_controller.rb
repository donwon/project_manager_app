class AnswersController < ApplicationController

def create
  reply = Reply.new(params.require(:reply).permit(:body))
  @discussion = Discussion.find(params[:question_id])
  reply.discussion = @discussion
  if reply.save
    redirect_to @discussion, notice:"Thanks"
  else
    render "discussion/show"

  end
end


end
