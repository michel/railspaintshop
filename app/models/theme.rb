class Theme < ActiveRecord::Base 
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :repo
  validates_uniqueness_of :name
  
  
  
end
