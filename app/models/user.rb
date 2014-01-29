class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :projects

  has_many :votes
  has_many :voted_projects, through: :votes, source: :project

  has_many :vote_downs
  has_many :votded_down_projects, through: :vote_downs, source: :project
  # def vote_for project
  #   votes.where(project_id: project.id).first
  # end

  # def has_liked? project
  #   voted_projects.include? project
  # end

end
