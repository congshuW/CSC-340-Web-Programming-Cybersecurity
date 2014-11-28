class Order < ActiveRecord::Base
  validates :name, :address, :email, :pay_type, :presence => {:message => 'must be entered'}
  #validates :email, :length => {maximum: 52, :message => 'email cannot have more than 52 characters '}
end
