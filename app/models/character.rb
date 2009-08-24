class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :clan
  belongs_to :city
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :bio, :on => :create, :message => "can't be blank"
  validates_presence_of :user, :on => :create, :message => "can't be blank"
end
