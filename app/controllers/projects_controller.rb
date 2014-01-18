class ProjectsController < ApplicationController

def index
	@projects = Project.all
end

def new
	@project = Project.new
end

def create
	project = Project.new params.require(:project).permit([:project_no, :client_name, :title, :description, :status])
	project.save
	redirect_to projects_path
end

def show
	@project = Project.find(params[:id])

end

def edit
	@project = Project.find(params[:id])
end

def update
    @project = Project.find(params[:id])
    
    #is the a for loop I can implement to do this?

	@project.project_no = params[:project][:project_no]
	@project.title = params[:project][:title]
	@project.client_name = params[:project][:client_name]
	@project.description = params[:project][:description]
	@project.status = params[:project][:status]

	@project.save

	redirect_to projects_path
end

def destroy
	@project = Project.find(params[:id])
	@project.destroy
	redirect_to projects_path
end


end
