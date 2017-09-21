class Product < ActiveRecord::Base
  has_one :photo
  is_impressionable
  accepts_nested_attributes_for :photo
end
