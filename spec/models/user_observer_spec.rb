require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe UserObserver do 
  
  it "should generate an activation code after user create" do
    @user = User.create(:email => "jeroen@re-invention.nl", :password => "password", :password_confirmation => "password");
    @user.activation_code.should_not be_nil
  end
    
  it "should send activation mail after user create" do
      @user = User.new(:email => "michel@re-invention.nl", :password => "password", :password_confirmation => "password");
      UserMailer.expects(:deliver_activation).with(@user)      
      @user.save      
  end
  
  
      
end
