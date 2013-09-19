@kc12
Feature: Award No Cost Extension creation and submission


  As a Central Administrator
  I want to be able to apply a No Cost Extension to an existing award extending the obligated/anticipated time


  Background:
    Given I am up top


  Scenario: Create and finalize No Cost Extension to existing award


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" tab
  When I click the "Award" search link
    And I set "Award Status" to "Active"
    And I set "Award Title" to "Test scenario: create and submit basic proposal"
    And I click the "Search" button
  Then I should see one or more items retrieved
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
  When I set the "Organization Document Number" to "1234 KR"
    And I set "Transaction Type" to "No Cost Extension"
    And I set "Notice Date" to "10/10/2018"
    And I set "Comments" text area to "Mod 4: NCE to 6/11/2019"
    And I set "Sponsor Award ID" to "R01AG012345"
    And I set "Modification ID" to "05"
    And I click "Save" button
  Then I should see the message "Document was successfully saved."


  When I click the "Time & Money" button
    And I click the "Edit" button at the bottom of the page
    And I set "Transaction Type" to "No Cost Extension"
    And I set "Notice Date" to "10/10/2018"
    And I set "Oblg. End" to "06/11/2019"
    And I set "Project End" to "06/11/2019"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click "Show" on the "Direct/F&A Funds Distribution" tab
    And I set "end date" in row 5 to "06/11/2019"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to ":FINAL" in the document header
  When I click the "Return to Award" button


    And I am on the "Commitments" document tab
    And I click "Show" on the "Rates" tab
    And I set the "Rate" to "51.50"
    And I set the "Type" to "MTDC"
    And I set the "Fiscal Year" to "2016"
  Then I should see "Start Date" as "07/01/2015"
    And I should see "End Date" as "06/30/2016"
    And I should see "Campus" as "on"
  When I click "Add" button
    And I set the "Rate" to "51.50"
    And I set the "Type" to "MTDC"
    And I set the "Fiscal Year" to "2017"
  Then I should see "Start Date" as "07/01/2016"
    And I should see "End Date" as "06/30/2017"
    And I should see "Campus" as "on"
  When I click "Add" button
    And I set the "Rate" to "51.50"
    And I set the "Type" to "MTDC"
    And I set the "Fiscal Year" to "2018"
  Then I should see "Start Date" as "07/01/2017"
    And I should see "End Date" as "06/30/2018"
    And I should see "Campus" as "on"
  When I click "Add" button
    And I set the "Rate" to "51.50"
    And I set the "Type" to "MTDC"
    And I set the "Fiscal Year" to "2019"
  Then I should see "Start Date" as "07/01/2018"
    And I should see "End Date" as "06/30/2019"
    And I should see "Campus" as "on"
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Award Actions" document tab
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see "No Validation Errors present."
    And I should see "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to ":FINAL" in the document header
    And I should see the message "Document was successfully submitted."