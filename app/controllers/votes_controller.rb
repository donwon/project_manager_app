class VotesController < ApplicationController
before_action :authenticate_user!
before_action :find_project

def vote_up

  redirect_to projects_path, notice: "Voted Up"

end

def vote_down

  redirect_to projects_path, notice: "Voted Down"

end


def vote_delete

    redirect_to projects_path, notice: "Thank you for voting DOWN"

end

def create

  redirect_to projects_path, notice: "Thank you for voting UP CREATE"

end

def find_project
  @project = Project.find params[:project_id]

end




end
