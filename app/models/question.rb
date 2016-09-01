class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :answers
  has_many :votes, as: :votable
  belongs_to :user
end
