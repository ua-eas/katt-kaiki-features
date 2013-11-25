@Award_Unlink_IP
Feature: Unlink an institutional proposal


  As a Central Administrator
  I want to be able to unlink an institutional proposal from an existing award


  Background:
    Given I am up top


  Scenario: Unlink and Edit an Institutional Proposal


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" system tab
  When I click the "Institutional Proposal" search link
    And I set "Proposal Type" to "New" on the search page
    And I set "Status" to "Funded" on the search page
    And I set "Project Title" to "Test scenario*" on the search page
    And I click the "Search" button
    And I sort by Institutional Proposal ID on the search page
    And I "open" the first record on the search page
  Then I click "Show" on the "Institutional Proposal" tab
    And I should see "Proposal Type" text set to "New"
    And I should see "Updated By" text set to "sandovar"
    And I should see "Project Title" text set to something like "Test scenario:"
    And I should see "Status" text set to "Funded"
  When I click the "Edit" button
    And I am in the "Document Overview" tab
    And I set the "Explanation" to "Unlink Awd 001234-00001 Acct 3001500"


  When I am on the "Institutional Proposal Actions" document tab
    And I click "Show" on the "Funded Awards" tab
    And I check the "Actions" checkbox
    And I click the "Unlock Selected" button
    And I click the "Yes" button


  When I am on the "Institutional Proposal" document tab
    And I click "Show" on the "Institutional Proposal" tab
  Then I should see "Proposal Type" set to "New"
    And I should see "Updated By" text set to "sandovar"
    And I should see "Project Title" set to something like "Test scenario:"
    And I should see "Status" set to "Pending"
    And I set "Project Title" to "Test scenario: IP unlinked"
    And I set "Activity Type" to "Research Training"


  When I am on the "Institutional Proposal Actions" document tab
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see the message "No Validation Errors present."
    And I should see the message "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Status" text set to "FINAL" in the document header
    And I should see the message "Document was successfully submitted."