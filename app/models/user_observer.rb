class UserObserver < ActiveRecord::Observer
 
  def after_create(user)   
    user.generate_activation_code!        
    UserMailer.deliver_activation(user)
  end
end