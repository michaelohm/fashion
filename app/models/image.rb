class Image < ActiveRecord::Base

  belongs_to :post
  has_attached_file :photo,
    :styles => {:small => "100x100", :large => "600x600"},
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/aws.yml";

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
end
