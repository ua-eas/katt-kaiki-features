@Award_Unlink_IP
Feature: Unlink an institutional proposal


  As a Central Administrator
  I want to be able to unlink an institutional proposal from an existing award 


  Background:
    Given I am up top


  Scenario: Unlink and edit an institutional proposal


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" tab
  When I click the "Institutional Proposal" portal link
    And I set "Proposal Type" to "New"
    And I set "Status" to "Funded"
    And I set "Project Title" to "Test scenario*"
    And I click the "Search" button
    And I sort by Institutional Proposal ID
    And I "open" the first record
  Then I click "Show" on the "Institutional Proposal" tab
    And I should see "Proposal Type" set to "New"
    And I should see "Updated By" set to "sandovar"
    And I should see "Project Title" set to "Test scenario:"
    And I should see "Status" set to "Funded"
  When I click the "Edit" button at the bottom of the page
  Then I set the "Explanation:" text area to "Unlink Awd 001234-00001 Acct 3001500"
  
  
  When I am on the "Institutional Proposal Actions" document tab
    And I click "Show" on the "Funded Awards" tab
    And I check the "Actions" checkbox
    And I click the "Unlock Selected" button
    And I click the "Yes" button
    
    
    And I am on the "Institutional Proposal" document tab
    And I click "Show" on the "Institutional Proposal" tab  
  Then I should see "Proposal Type" set to "New"
    And I should see "Updated By" set to "sandovar"
    And I should see "Project Title" set to "Test scenario:"
    And I should see "Status" set to "Pending"
  When I set "Project Title" text area to "Test scenario: IP unlinked"
    And I set "Activity Type" to "Research Training"
    
    
    And I am on the "Institutional Proposal Actions" document tab
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see "No Validation Errors present."
    And I should see "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Status" set to "FINAL" in the document header
    And I should see the message "Document was successfully submitted."
