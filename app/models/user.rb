class User < ActiveRecord::Base
  acts_as_authentic 
  has_many :characters
  belongs_to :city
end