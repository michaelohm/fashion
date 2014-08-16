class Post < ActiveRecord::Base

  belongs_to :user
  has_one :image
  has_many :comments
  
end
