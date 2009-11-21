require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe User do                 
   before(:each) do
    @user =  User.create(:email => "michel@re-invention.nl", :password => "password", :password_confirmation => "password")
   end               
  
  it { should have_column(:email, :type => :string) }
  it { should have_column(:crypted_password, :type => :string) }
  it { should validate_uniqueness_of(:email, :case_sensitive => false) } 
  it { should allow_values_for(:email, "test@test.nl", "test@test.info") }
  it { should_not allow_values_for(:email, "blaat.nl", "test@ .nl") }   
  
  
  
end
