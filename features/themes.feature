Feature: Themes
  In order to find an awesome theme for your awesome rails app 
  Visitors are able to browse the available themes        
  
  Background:
  Given that the following themes exist:
  | name         | description    | repo                           |
  | nice theme 1 | "nice 1"       | git://test.nl:nice_theme1.git  |
  | nice theme 2 | "nice 2"       | git://test.nl:nice_theme2.git  |
  | nice theme 3 | "nice 3"       | git://test.nl:nice_theme3.git  |
  
  Scenario: No themes on the site yet.
  Given there are no themes on the site
  And I am on the themes page
  Then I should see "No themes available! Please come back later."
  
  Scenario: There are available themes
  And I am on the themes page
  Then I should see "nice theme 1"
  Then I should see "nice theme 2"
  Then I should see "nice theme 3"
                                  
  
  Scenario: Theme details 
  And I am on the themes page
  When I follow "nice theme 1"
  Then I should see "nice theme 1"
  And I should see "Added less than a minute ago"
  And I should see "Description"
  And I should see "nice 1"
  And I should see "git://test.nl:nice_theme1.git"
 
  
