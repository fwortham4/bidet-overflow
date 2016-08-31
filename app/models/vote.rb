class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates_presence_of :value, :user_id, :votable_id, :votable_type
end
