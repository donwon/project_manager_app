class VotesController < ApplicationController
before_action :authenticate_user!
before_action :find_project

def vote_up
  @project.score += 1
  @project.up_voters << current_user
  @project.save

  redirect_to projects_path, notice: "Voted Up"

end

def vote_down
  @project.score -= 1
  @project.down_voters << current_user  
  @project.save
  redirect_to projects_path, notice: "Voted Down"

end

def votes_delete
    @project.up_voters.include?(current_user)
    @project.up_voters.delete(current_user)
    @project.score -= 1
    @project.save
    redirect_to projects_path, notice: "Up Vote withdrawn" 
end

def votedown_delete
    @project.up_voters.include?(current_user)
    @project.down_voters.delete(current_user)
    @project.score += 1
    @project.save
    redirect_to projects_path, notice: "Down Vote withdrawn"
end

def find_project
  @project = Project.find params[:project_id]

end

end
