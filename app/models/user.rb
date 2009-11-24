class User < ActiveRecord::Base  
  acts_as_authentic                                          
  
  def generate_activation_code!    
    update_attribute(:activation_code,Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join))    
  end 
  
  def activate!
    self.activation_code = nil
    self.activated_at = DateTime.now
  end
          
end