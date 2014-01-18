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

def destroy
	@project = Project.find(params[:id])
	@project.destroy
	redirect_to projects_path
end


end
