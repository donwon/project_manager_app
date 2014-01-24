class Discussion < ActiveRecord::Base
has_many :replies
validates :title, presence:true, length: {minimum:10}

scope :order_by_likes, -> { order("counter ASC") } 
#now make likes a get route to launch this, and reorganize index to show vie
#with order by likes.

end
