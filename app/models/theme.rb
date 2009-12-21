class Theme < ActiveRecord::Base 
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :repo
  validates_uniqueness_of :name
    
   def to_param
     "#{id}-#{name.downcase.gsub(/[^a-z0-9]+/i, '-')}"
   end  
  
  
end
