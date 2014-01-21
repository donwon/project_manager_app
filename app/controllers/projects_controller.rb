class ProjectsController < ApplicationController

before_action :set_project, only: [:show,:edit,:update]


def index
	@projects_recent = Project.order("created_at DESC")[0..2]
	@projects_by_hits = Project.order("hit_counter DESC")

end

def new
	@project = Project.new
end

def create
	@project = Project.new params.require(:project).permit([:project_no, :client_name, :title, :description, :status])
	if @project.save
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
		if @project.update_attributes params.require(:project).permit([:project_no, :client_name,:title,:description, :status])
			redirect_to projects_path, notice: "Project has been updated"
		else
			render :edit, alert: "Error updating record to database"
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

private

def set_project
	@project = Project.find(params[:id])
end


end
