Feature: Show available themes
  In order to find an awesome theme for your awesome rails app 
  Visitors are able to browse the available themes
  
  Scenario: No themes on the site yet.
  Given there are no themes on the site
  And I am on the themes page
  Then I should see "No themes available! Please come back later."
  
  Scenario: There are available themes
  Given that the following themes exist:
   | name         | description    | repo                           |
   | nice theme 1 | "nice 1"       | git://test.nl:nice_theme1.git  |
   | nice theme 2 | "nice 2"       | git://test.nl:nice_theme2.git  |
   | nice theme 3 | "nice 3"       | git://test.nl:nice_theme3.git  |
  And I am on the themes page 
  Then I should see "nice theme 1"       
  Then I should see "nice theme 2"        
  Then I should see "nice theme 3"
