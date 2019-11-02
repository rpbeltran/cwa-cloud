Feature: UploadStory
  
  I upload a story
  
  Scenario: upload a story
    
    Given I am on the upload story page
    
    When I select a file
    
    When I have a filename
    
    When I have a first name
    
    When I have a last name
    
    When I click submit
    
    Then I upload a file