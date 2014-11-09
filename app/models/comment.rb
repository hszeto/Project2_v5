class Comment
  include Mongoid::Document
  include Mongoid::Paperclip

  field :author, type: String
  field :comment, type: String
  field :avatar, type: String
  
  belongs_to :post
  belongs_to :user

  has_mongoid_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 

end
