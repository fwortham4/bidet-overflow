class User < ActiveRecord::Base
  include BCrypt
  has_many :comments
  has_many :answers
  has_many :votes
  has_many :questions

  validates_presence_of :user_name, :email, :hash_password
  validates_uniqueness_of :email
  validates :password_length, :valid_email
 
  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def password_length
    if @raw_password.length < 6
      errors.add(:password, "must be 6 at least 6 characters!")
    end
  end 

  def valid_email
    if !self.email.include? "@"
      errors.add(:email, "must contain @ symbol to be an email!")
    end
  end

end
