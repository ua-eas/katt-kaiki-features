@Award_Supp_Cont_II
Feature: Award supplement/continuation II creation and submission


  As a Central Administrator
  I want to be able to decrease anticipated funding and increase obligated funding to an existing award using the TNM transactions panel.


  Background:
    Given I am up top


  Scenario: Create and Finalize Supplement/Continuation II to Existing Award


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" system tab
  When I click the "Award" search link
    And I set "Award Status" to "Active" on the search page
    And I set "Award Title" to "Test scenario:*" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I sort by Award ID on the search page
  When I "open" the first record on the search page
    And I click the "Edit" button
  When I am in the "Document Overview" tab
  Then I should see "Description" set to "Garland, NIA, 3001500"
  When I am in the "Details & Dates" tab
    And I am in the "Details and Dates" section
    And I should see "Award ID" text set to something like "-00001" in the "Institution" subsection
    And I should see "Award Status" set to "Active" in the "Institution" subsection
    And I should see "Account ID" set to "3001500" in the "Institution" subsection
    And I should see "Award Title" set to something like "Test scenario:" in the "Institution" subsection
    And I should see "Lead Unit ID:" text set to "0721 - Cancer Center Division" in the "Institution" subsection
    And I should see "Activity Type" set to "Research" in the "Institution" subsection
    And I should see "Award Type" set to "Grant" in the "Institution" subsection
    And I should see "Sponsor ID" set to "010803" in the "Sponsor" subsection
    And I should see "Sponsor Award ID" set to something like "R01AG012345" in the "Sponsor" subsection
    And I should see "Modification ID" set to something like "0" in the "Sponsor" subsection
    And I should see "CFDA Number" set to "93.866" in the "Sponsor" subsection
    And I should see "NSF Science Code" set to "F.02: Biological - Life Sciences" in the "Sponsor" subsection
    And I should see "Project Start Date" text set to "02/01/2014" in the "Time & Money" subsection
    And I should see "Project End Date" text set to "01/31/2019" in the "Time & Money" subsection
    And I should see "Execution Date" set to "12/15/2013" in the "Time & Money" subsection
    And I should see "Anticipated Amount" text set to "$500,000.00" in the "Time & Money" subsection
  When I am in the "Document Overview" tab
    And I set the "Organization Document Number" to "1235 KR"
  When I am in the "Details & Dates" tab
    And I am in the "Details and Dates" section
    And I set "Transaction Type" to "Continuation/Supplement" in the "Current Action" subsection
    And I set "Notice Date" to "02/01/2015" in the "Current Action" subsection
    And I set the "Comments" to "Mod 02: Yr 2 Increase Obligated, Decrease Anticipated" in the "Current Action" subsection
    And I set "Sponsor Award ID" to "R01AG012345" in the "Sponsor" subsection
    And I set "Modification ID" to "02" in the "Sponsor" subsection
    And I slow down
    And I click "Save" button
  Then I should see the message "Document was successfully saved."


  When I click the "Time & Money" button
    And I click the "Edit" button
    And I am in the "Award Hierarchy" tab
    And I set "Transaction Type" to "Continuation/Supplement"
    And I set "Notice Date" to "02/01/2015"
    And I click "Show" on the "Transactions" tab
    And I am in the "Transactions" section
    And I set "Source Award" to something like "-00001"
    And I set "Destination Award" to "External"
    And I set "Anticipated" to "100000"
    And I click "Add" button
    And I set "Source Award" to "External"
    And I set "Destination Award" to something like "-00001"
    And I set "Obligated" to "5000"
    And I click "Add" button
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" text set to ":FINAL" in the document header
  When I am in the "Award Hierarchy" tab
    And I should see "Obligated" set to "105,000.00"
    And I should see "Anticipated" set to "400,000.00"
    And I click the "Return to Award" button
  When I am in the "Details & Dates" tab
    And I am in the "Details and Dates" section
  Then I should see "Anticipated Amount" text set to "$400,000.00" in the "Time & Money" subsection
    And I should see "Obligated Amount" text set to "$105,000.00" in the "Time & Money" subsection
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Award Actions" document tab
    And I am fast
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see the message "No Validation Errors present."
    And I should see the message "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" text set to ":FINAL" in the document header
    And I should see the message "Document was successfully submitted."