Before do
  User.create!(:email => "michel@re-invention.nl", :password => "password" ,:password_confirmation => "password")    

end       


Given /^I am logged in the application$/ do
  @current_user_session =  mock(:current_user_session)   
  @current_user_session.stubs(:destroy)
  controller.expects(:current_user_session).returns(@current_user_session)
end

