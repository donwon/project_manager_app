class Task < ActiveRecord::Base
  belongs_to :project

  validates :body, presence:true
  after_initialize :set_due_date

  def set_due_date
     self.due_date = (Time.now + 1.days) 
  end

end
