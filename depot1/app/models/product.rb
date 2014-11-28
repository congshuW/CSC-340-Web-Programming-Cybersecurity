class Product < ActiveRecord::Base
  validates :price, :title, :description, :image_url, :presence => {:message => 'must be entered'}
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01, :message => 'must be at least 0.01'}
  validates :image_url, :format => {:with => %r{\.(?:gif|jpg|png)\z}, :message => 'must be a URL for GIF, JPG, or PNG image'}
end
