class User < ActiveRecord::Base
  has_many :comments
  has_many :answers
  has_many :votes
  has_many :questions
end
