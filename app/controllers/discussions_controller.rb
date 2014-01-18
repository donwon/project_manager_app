class DiscussionsController < ApplicationController

def index
	@dicussions = Discussion.all
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
end

def edit
	@discussion = Discussion.find(params[:id])
end

def update
	discussion = Discussion.find(params[:id])
	discussion.title = params[:discussion][:title]
	discussion.body = params[:discussion][:title]
	discussion.save
	redirect_to discussions_path

end

def destroy
	discussion = Discussion.find(params[:id])
	discussion.destroy
	redirect_to discussions_path


end


end
