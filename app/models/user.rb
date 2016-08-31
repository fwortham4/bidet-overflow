class User < ActiveRecord::Base
  has_many :comments
  has_many :answers
  has_many :votes
  has_many :questions

  validates :email, presence: true, uniquiness: true
  validates :password, presence: true

  include BCrypt




end
