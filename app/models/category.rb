class Category < ActiveRecord::Base

has_many :categorizations, dependent: :destroy
has_many :projects, through: :catergorizations

end
