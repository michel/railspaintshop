require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe UserMailer do
  
    describe "Signup Email" do
        include EmailSpec::Helpers
        include EmailSpec::Matchers
        include ActionController::UrlWriter
    
        before(:all) do                              
          @user = User.new(:email => "michel@re-invention.nl")
          @user.stubs(:activation_code).returns("harbl")
          @email = UserMailer.create_activation(@user)
        end
    
        it "should be set to be delivered to the email passed in" do
          @email.should deliver_to(@user.email)
        end
        
        it "should contain the user's message in the mail body" do
          @email.should have_text(/activate/)           
        end
        
        it "should contain a link to the confirmation link" do    
          @email.should have_text(/#{@user.activation_code}/)
        end
        
        it "should have the correct subject" do
          @email.should have_subject(/Account confirmation/)
        end
                 
      end
             
end
