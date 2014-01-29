class Project < ActiveRecord::Base
  has_many :tasks
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  
  #For creating voting relationships
  has_many :votes
  has_many :up_voters, through: :votes, source: :user

  has_many :vote_downs
  has_many :down_voters, through: :vote_downs, source: :user



  attr_accessor :terms_accepted

  validates :title, presence:true, length: {minimum:10}
  validates :project_no, numericality: true, allow_nil: true
  #validates :terms_accepted, acceptance: {accept: 1}#, allow_nil:false
  validates_acceptance_of :terms_accepted

  #Scope that orders projects by hit count
  scope :order_by_hits, -> { order("hit_counter DESC") } #doesnt expect pipes
  scope :x_most_recent, lambda { |max| order("created_at DESC").limit(max) }
  scope :test, Proc.new { |max| order("created_at DESC").limit(max) }
  #proc will short circuit app.

  #before_save :capitalize_title #will do this for both create & update
  before_create :capitalize_title

  #after_commit is better to use.
  #after_save :print_msg_after_save
  after_commit :print_msg_after_save

# def vote_up_by user

#   up_voters << user && increment_votes(1)

# end

# def vote_down_by user

#   down_voters << user && increment_votes(-1)

# end

# def votes_delete_by user
#   up_voters.delete(user)
#   down_voters.delete(user)
# end

# def increment_votes value
#   @project.score += value
#   save

# end





  #Method that returns a list of Question records that has a title size greater than 30 characters
    def self.long_titled

      #Project.all.select {|x| x[:title].length > 30}  #Highly Discouraged to use this 
      Project.all.select {|x| x.title.length > 30}

    end

  #Method generates list of projects that has a title greater than 30 char, gen 100 with varying length

    def self.generate_random_project(number_of_projects = 100)
      #first generate random string
      number_of_projects.times do |x|
        random_title = (0..rand(50)).map {|x| ('a'..'z').to_a[rand(26)] }.join
        Project.create(title: random_title, description: "hello this title is generated")
      end

    end

    def self.hash_example
      new_hash = {}
      Project.all.each {|x| new_hash[x.id] = x.title.length}
          #Project.all.each do |project|
          #new_hash[project.id] = project.title.length
          #end
      new_hash
    end

private
def capitalize_title
  self.title.capitalize!
end

def print_msg_after_save
  Rails.logger.info "after save"
end



end