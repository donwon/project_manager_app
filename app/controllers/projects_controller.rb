class ProjectsController < ApplicationController

before_action :require_login, only:[:new, :edit,:update, :create]
before_action :print_to_console, except: [:index , :new, :create] 

before_action :set_project, only: [:show, :edit, :update]

def index
	#puts Project.hash_example
	#Project.generate_random_project(5)
	@projects_recent = Project.order("created_at DESC")[0..2]
	@projects_by_hits = Project.order("hit_counter DESC")

	#find the id's of recent projects and save it to variable
	recent_ids = []
	@projects_recent.each {|x| recent_ids << x.id }

	Rails.logger.info '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
	Rails.logger.info recent_ids

	@projects_left_over = @projects_by_hits.select { |x| !recent_ids.include?(x.id) }
	@projects_w_long_title = Project.long_titled

end

def new
	@project = Project.new
end

def create
	
	@project = Project.new params.require(:project).permit([:project_no, :client_name, :title, :description, :status, :terms_accepted])
	if @project.save
		#flash.now[:notice]="Project has been saved to database"
		redirect_to projects_path, notice: "Project has been saved to database"
		
	else
	flash.now[:alert]="Error saving record to database"
	render :new
	end

end

def show
 @project.hit_counter += 1
 @project.save
end

def edit

end

def update  
		if @project.update_attributes params.require(:project).permit([:project_no, :client_name,:title,:description, :status, :terms_accepted])
			#flash.now[:notice]="Project has been updated"
			redirect_to projects_path, notice: "Project has been updated"

		else
			flash.now[:alert] = "Error updating record to database"
			render :edit
		end  

	#is the a for loop I can implement to do this?

	# @project.project_no = params[:project][:project_no]
	# @project.title = params[:project][:title]
	# @project.client_name = params[:project][:client_name]
	# @project.description = params[:project][:description]
	# @project.status = params[:project][:status]



end

def destroy
	@project = Project.find(params[:id])
	@project.destroy
	redirect_to projects_path
end

def favorites
  redirect_to projects_path
end

private

def require_login
	if session[:logged_in?] == false
	redirect_to projects_path, alert: "You Must Log in to Add/Modify Projects, feel free to post a Discussion"
	end
end


#pints to console the ids of project loaded
def print_to_console
	@project = Project.find(params[:id])
	Rails.logger.info '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
	Rails.logger.info @project.id
	Rails.logger.info '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
end


def set_project
	@project = Project.find(params[:id])
end


end
