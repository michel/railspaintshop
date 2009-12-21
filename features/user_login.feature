Feature: Login
  In order to identify users in the application
  Users
  Need to be able to login
  
  Scenario: User attempts to login with valid credentials
    Given I am on the login page
    When I fill in "Email" with "michel@re-invention.nl"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should see "Successfully logged in!"

  Scenario: User attempts to login with invalid credentials
    Given I am on the login page
    When I fill in "Email" with "michel@re-invention.nl"
    And I fill in "Password" with "webrat"
    And I press "Login"
    Then I should see "Invalid user credentials"  
    
  Scenario: User logs out
    Given I am logged in the application
    When I go to the logout page    
    Then I should see "Logout successfull!"
    