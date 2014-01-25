class TasksController < ApplicationController
before_action :set_project
before_action :set_task, only:[:destroy]


def create
  @task = Task.new params.require(:task).permit(:body)
  @project = Project.find(params[:project_id])
  @task.project = @project
  if @task.save
    redirect_to @project, notice:"Thanks"
  else
    redirect_to @project, alert:"Task cannot be empty"
  end
end


  def destroy
    @task.destroy
    redirect_to @project, notice:"Task Deleted"
  end

private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])

    #the argument passed here is project_id, because
    #the routes explicitly says, the id is project_id

  end

end
