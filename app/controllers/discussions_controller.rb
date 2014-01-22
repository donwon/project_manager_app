class DiscussionsController < ApplicationController

before_action :set_discussion, only: [:show, :edit,:update, :flag]

def index
	@dicussions = Discussion.all
	#Rails.logger.info session[:project_ids]

end

def new
	@discussion = Discussion.new
end

def create
	@discussion = Discussion.new params.require(:discussion).permit([:title,:body])
	if @discussion.save
		redirect_to discussions_path, notice: "New Discussion Added to database"
	else
		flash.now[:alert] = "Error in creating new discussion"
		render :new
	end
	
end

def show
	#@discussion = Discussion.find(params[:id])
	#session[:project_ids] = params[:id]
end

def edit
	#@discussion = Discussion.find(params[:id])
end

def update
	
	# discussion.title = params[:discussion][:title]
	# discussion.body = params[:discussion][:body]
	@discussion.update_attributes params.require(:discussion).permit([:title,:body])
	if @discussion.save
		redirect_to discussions_path, notice: "Update Success"
	else
		flash.now[:alert] = "Error updating records"
		render :edit
	end

end

def destroy
	discussion = Discussion.find(params[:id])
	discussion.destroy
	redirect_to discussions_path
end

def like
	session[:discussion_ids] ||= []
	@discussion = Discussion.find(params[:id])
	@discussion.counter ||=0

	if session[:discussion_ids].include? params[:id]
		redirect_to discussions_path, alert: "Liked already"
	else
		@discussion.counter += 1 
	  session[:discussion_ids] << params[:id]
	  @discussion.save
	  redirect_to discussions_path, notice: "Thank you for liking this post"
	end

	#make new hash to count the project_ids stored in session array
	# @like_count = Hash.new(0)
	# @liked_ids.each { |v| @like_count[v] += 1 }
	
	# @number_of_likes = @like_count[params[:id]]
	#Rails.logger.info @number_of_likes
	#Rails.logger.info '>>>above is number of likes for this id>>>>>>>>>>>>>>>>>>>'

 
end

def flag
	redirect_to discussions_path
end

private
def set_discussion
	@discussion = Discussion.find(params[:id])
end



end
