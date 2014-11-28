class User < ActiveRecord::Base
  has_many :microposts
  before_save {|user| user.email = user.email.downcase}
  validates :name, length:{maximum: 50}, presence: true, presence: {message: 'name cannot be empty.'} 
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => {:with => email_regex}, :uniqueness=>{:case_sensitive=>false}
  validates :password, :password_confirmation, :length =>{:within=>6..40}, presence: true, presence: {message: 'password and its confirmation cannot be empty.'}
  has_secure_password
end
