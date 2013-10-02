@Award_Supp_Cont_II
Feature: Award supplement/continuation II creation and submission


  As a Central Administrator
  I want to be able to decrease anticipated funding and increase obligated funding to an existing award using the TNM transactions panel.


  Background:
    Given I am up top


  Scenario: Create and finalize supplement/continuation II to existing award


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" tab
  When I click the "Award" search link
    And I set "Award Status" to "Active"
    And I set "Award Title" to "Test scenario:*"
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
    And I should see "Sponsor Award ID" set to something like "R01AG012345-"
    And I should see "Modification ID" set to something like "0"
    And I should see "CFDA Number" set to "93.866"
    And I should see "NSF Science Code" set to "F.02: Biological - Life Sciences"
    And I should see "Project Start Date" set to "02/01/2014"
    And I should see "Project End Date" set to "01/31/2019"
    And I should see "Execution Date" set to "12/15/2013"
    And I should see "Anticipated Amount" set to "$500,000.00"
  When I set the "Organization Document Number" to "1235 KR"
    And I set "Transaction Type" to "Continuation/Supplement"
    And I set "Notice Date" to "02/01/2015"
    And I set the "Comments" text area to "Mod 02: Yr 2 Increase Obligated, Decrease Anticipated"
    And I set "Sponsor Award ID" to "R01AG012345"
    And I set "Modification ID" to "02"
    And I click "Save" button
  Then I should see the message "Document was successfully saved."


  When I click the "Time & Money" button
    And I slow down
    And I click the "Edit" button at the bottom of the page
    And I set "Transaction Type" to "Continuation/Supplement"
    And I set "Notice Date" to "02/01/2015"
    And I click "Show" on the "Transactions" tab
    And I set "Source Award" to something like "-00001"
    And I set "Destination Award" to "External"
    And I set "Anticipated" under "Transactions" as "100000"
    And I click "Add" button
    And I set "Source Award" to "External"
    And I set "Destination Award" to something like "-00001"
    And I set "Obligated" under "Transactions" as "5000"
    And I click "Add" button
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to ":FINAL" in the document header
    And I should see "Obligated" set to "105,000.00" in the award hierarchy
    And I should see "Anticipated" set to "400,000.00" in the award hierarchy
    And I click the "Return to Award" button
  Then I should see "Anticipated Amount" set to "$400,000.00"
    And I should see "Obligated Amount" set to "$105,000.00"
  When I click the "Save" button
    And I am fast
  Then I should see the message "Document was successfully saved."


  When I am on the "Award Actions" document tab
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see "No Validation Errors present."
    And I should see "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to something like ":FINAL" in the document header
    And I should see the message "Document was successfully submitted."
