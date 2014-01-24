class TasksController < ApplicationController

def create
  @task = Task.new params.require(:task).permit(:body)
  @project = Project.find(params[:project_id])
  @task.project = @project
  if @task.save
    redirect_to @project, notice:"Thanks"
  else
    render "projects/show"
    
  end
end

end
