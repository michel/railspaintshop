require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe User do                 
   before(:each) do
    @user =  User.create(:email => "michel@re-invention.nl", :password => "password", :password_confirmation => "password")
   end               
  
  it { should have_column(:email, :type => :string) }         
  it { should have_column(:crypted_password, :type => :string) }
  it { should have_column(:activation_code, :type => :string) }   
  it { should have_column(:activated_at, :type => :date) }          
  it { should have_many(:themes) }     
  it { should validate_uniqueness_of(:email, :case_sensitive => false) } 
  it { should allow_values_for(:email, "test@test.nl", "test@test.info") }
  it { should_not allow_values_for(:email, "blaat.nl", "test@ .nl") }   
  
  it "should generate a random activation code" do 
    @user.activation_code = nil 
    @user.activation_code.should be_nil        
    @user.generate_activation_code!     
    @user.activation_code.should_not be_nil   
  end                                        
  
 it "should activate the user" do   
   @user.activation_code.should_not be_nil  
   @user.activated_at.should be_nil   
   @user.activate!  
   @user.activation_code.should be_nil
   @user.activated_at.should_not be_nil   
 end
  
  
end
