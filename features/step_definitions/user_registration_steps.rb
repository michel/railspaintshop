Given /^there is an existing user with email "([^\"]*)"$/ do |email|
  User.create(:email => email , :password => "password", :password_confirmation => "password")
end
