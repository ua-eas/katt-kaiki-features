@Award_Admin_Amendment
Feature: Award administrative amendment


  As a Central Administrator
  I want to be able to administratively amend an existing award so that I can reflect the change in sponsor and addition of the prime sponsor


  Background:
  Given I am up top


  Scenario: Create and finalize administrative amendment to existing award


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" tab
  When I click the "Award" search link
    And I set "Award Status" to "Active"
    And I set "Award Title" to "Test scenario: create and submit basic proposal"
    And I click the "Search" button
  Then I should see one or more items retrieved
  When I sort by Award ID
  When I "open" the first record
    And I click the "Edit" button at the bottom of the page
  Then I should see "Description" set to "Garland, NIA, 3001500"
    And I should see "Award ID" set to something like "-00001"
    And I should see "Award Status" set to "Active"
    And I should see "Account ID" set to "3001500"
    And I should see "Award Title" set to something like "Test scenario:"
    And I should see "Lead Unit ID:" set to "0721 - Cancer Center Division"
    And I should see "Activity Type" set to "Research"
    And I should see "Award Type" set to "Grant"
    And I should see "Sponsor ID" set to "010803"
    And I should see "Sponsor Award ID" set to "1R01AG012345-01"
    And I should see "Modification ID" set to "01"
    And I should see "CFDA Number" set to "93.866"
    And I should see "NSF Science Code" set to "F.02: Biological - Life Sciences"
    And I should see "Project Start Date" set to "02/01/2014"
    And I should see "Project End Date" set to "01/31/2019"
    And I should see "Execution Date" set to "12/15/2013"
    And I should see "Anticipated Amount" set to "$500,000.00"
    And I should see "Obligation Start Date" set to "02/01/2014"
    And I should see "Obligation End Date" set to "01/31/2015"
    And I should see "Obligated Amount" set to "$100,000.00"
  When I set "Description" to "Garland, ASU, 3001500"
    And I set the "Organization Document Number" to "1234 KR"
    And I set "Transaction Type" to "Administrative Amendment"
    And I set "Notice Date" to "03/01/2014"
    And I set "Comments" text area to "Mod 3: Change sponsor and add prime"
    And I set "Sponsor ID" to "010152"
  Then I should see "Arizona State University" under the sponsor code
  When I set "Prime Sponsor" to "010803"
  Then I should see "National Institute on Aging" under the sponsor code
    And I set "Sponsor Award ID" to "R01AG012345"
    And I set "Modification ID" to "03"
    And I slow down
    And I click "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Award Actions" document tab
    And I am fast
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see "No Validation Errors present."
    And I should see "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to ":FINAL"
    And I should see the message "Document was successfully submitted."
