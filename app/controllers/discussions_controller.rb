class DiscussionsController < ApplicationController

def index
	@dicussions = Discussion.all
	#Rails.logger.info session[:project_ids]
	

end

def new
	@discussion = Discussion.new
end

def create
	discussion = Discussion.new params.require(:discussion).permit([:title,:body])
	discussion.save
	redirect_to discussions_path
end

def show
	@discussion = Discussion.find(params[:id])
	#session[:project_ids] = params[:id]
end

def edit
	@discussion = Discussion.find(params[:id])
end

def update
	discussion = Discussion.find(params[:id])
	discussion.title = params[:discussion][:title]
	discussion.body = params[:discussion][:body]
	discussion.save
	redirect_to discussions_path

end

def destroy
	discussion = Discussion.find(params[:id])
	discussion.destroy
	redirect_to discussions_path
end

def like
	session[:project_ids] ||= []
	session[:project_ids] << params[:id]
	@liked_ids = session[:project_ids].split('')
	Rails.logger.info @liked_ids
	Rails.logger.info '>>>>>>>>>>>>>>>>>>>>>>'
	Rails.logger.info @likes.kind_of?(Array)
	Rails.logger.info '@likes is array? >>>>>>>>>>>>>>>>>>>>>'

	@discussion = Discussion.find(params[:id])

	#make new hash to count the project_ids stored in session array
	@like_count = Hash.new(0)
	@liked_ids.each { |v| @like_count[v] += 1 }
	
	@number_of_likes = @like_count[params[:id]]
	Rails.logger.info @number_of_likes
	Rails.logger.info '>>>above is number of likes for this id>>>>>>>>>>>>>>>>>>>'

	@discussion.counter = @number_of_likes
	@discussion.save

 redirect_to discussions_path
end

end
