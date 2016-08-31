class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates_presense_of :content, :user_id, :commentable_id, :commentable_type
end
