class Comment
  include Mongoid::Document
  field :author, type: String
  field :comment, type: String

  belongs_to :post

end
