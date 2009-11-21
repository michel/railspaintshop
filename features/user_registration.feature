Feature: User registration
  In order to identify users in the application
  Users
  Need to be able to create a user account
  
  Scenario: User attempts to create a new user account
    Given I am on the signup page
    When I fill in "Email" with "jeroen@re-invention.nl"
    And I fill in "Password" with "password"    
    And I fill in "Password confirmation" with "password"   
    And I press "Register"
    Then I should see "Successfully signed up!"          
    
  Scenario: User attempts to create a new user account with invalid input
    Given I am on the signup page
    When I fill in "Email" with "jeroenre-invention.nl"
    And I fill in "Password" with "password"    
    And I fill in "Password confirmation" with "password"   
    And I press "Register"
    Then I should see "should look like an email address"
    
   Scenario: User already exists
    Given I am on the signup page  
    And there is an existing user with email "jackass@re-invention.nl"
    When I fill in "Email" with "jackass@re-invention.nl"
    And I fill in "Password" with "password"    
    And I fill in "Password confirmation" with "password"   
    And I press "Register"
    Then I should see "has already been taken"   
                                                        