class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :likes
  has_attached_file :photo,
    :styles => {:small => "150x150", :large => "600x600"},
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/aws.yml";

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :title, :description, :photo, presence: true
  
end
