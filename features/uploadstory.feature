Feature: UploadStory
  
  I upload a story
  
  Scenario: upload a story
    
    Given I have a file
    
    And I have a filename
    
    And I have a first name
    
    And I have a last name
    
    When I click submit
    
    Then I upload a file