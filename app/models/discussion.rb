class Discussion < ActiveRecord::Base

validates :title, presence:true, length: {minimum:10}

end
