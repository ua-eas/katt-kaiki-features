@Award_Allotment
Feature: Award allotment (increment) creation and submission


  As a Central Administrator
  I want to be able to add incremental funding to an existing award based
  on an institutional proposal
  so that I can reflect the increase in obligated amount

  Background:
    Given I am up top

  Scenario: Create and Finalize Increment to Existing Award


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" system tab
  When I click the "Award" search link
    And I set "Award Status" to "Active" on the search page
    And I set "Award Title" to "Test scenario: create and submit basic proposal" on the search page
    And I click the "Search" button
  When I sort by Award ID on the search page
  Then I should see one or more items retrieved on the search page
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
    And I should see "Sponsor Award ID" set to "1R01AG012345-01" in the "Sponsor" subsection
    And I should see "Modification ID" set to "01" in the "Sponsor" subsection
    And I should see "CFDA Number" set to "93.866" in the "Sponsor" subsection
    And I should see "NSF Science Code" set to "F.02: Biological - Life Sciences" in the "Sponsor" subsection
    And I should see "Project Start Date" set to "02/01/2014" in the "Time & Money" subsection
    And I should see "Project End Date" text set to "01/31/2019" in the "Time & Money" subsection
    And I should see "Execution Date" set to "12/15/2013" in the "Time & Money" subsection
    And I should see "Anticipated Amount" text set to "$500,000.00" in the "Time & Money" subsection
    And I should see "Obligation Start Date" text set to "02/01/2014" in the "Time & Money" subsection
    And I should see "Obligation End Date" text set to "01/31/2015" in the "Time & Money" subsection
    And I should see "Obligated Amount" text set to "$100,000.00" in the "Time & Money" subsection
  When I am in the "Document Overview" tab
    And I set the "Organization Document Number" to "1234 KR"
  When I am in the "Details & Dates" tab
    And I am in the "Details and Dates" section
    And I set "Transaction Type" to "Allotment (Increment)" in the "Current Action" subsection
    And I set "Notice Date" to "01/01/2015" in the "Current Action" subsection
    And I set the "Comments" to "Mod 02: Yr 2 Obl $100,000, 02/01/2015-01/31/2016" in the "Current Action" subsection
    And I set "Sponsor Award ID" to "5R01AG012345-02" in the "Sponsor" subsection
    And I set "Modification ID" to "02" in the "Sponsor" subsection
    And I slow down
    And I click "Save" button
  Then I should see the message "Document was successfully saved."


  When I click the "Time & Money" button
    And I am fast
    And I click the "Edit" button
  When I am in the "Award Hierarchy" tab
    And I am in the "Award Hierarchy" section
    And I set "Transaction Type" to "Allotment (Increment)"
    And I set "Notice Date" to "01/01/2015"
    And I set "Oblg. End" to "01/31/2016"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click "Show" on the "Transactions" tab
    And I am in the "Pending Transactions" section
    And I set "Source Award" to "External"
    And I set "Destination Award" to something like "-00001"
    And I set "Obligated" to "100,000.00"
    And I click "Add" button
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" text set to ":FINAL" in the document header
  When I click the "Return to Award" button
  When I am in the "Details & Dates" tab
    And I am in the "Details and Dates" section
  Then I should see "Obligation End Date" text set to "01/31/2016" in the "Time & Money" subsection
    And I should see "Obligated Amount" text set to "$200,000.00" in the "Time & Money" subsection
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Contacts" document tab
    And I am fast
  Then I should see the message "Document was successfully saved."


  When I am on the "Commitments" document tab
    And I click "Show" on the "Rates" tab
    And I am in the "F&A Rates" section
    And I set the "Rate" to "51.50"
    And I set the "Type" to "MTDC"
    And I set the "Fiscal Year" to "2016"
    And I slow down
  Then I should see "Start Date" as "07/01/2015"
    And I should see "End Date" as "06/30/2016"
    And I should see "Campus" as "on"
  When I click "Add" button
    And I click the "Recalculate" button
  Then I should see the "F&A Rates" table filled out with:
        | # | Rate  | Type | Fiscal Year | Start Date | End Date  | Campus | Source | Destination | Unrecovered F&A |
        | 1 | 51.50 | MTDC | 2014        | 07/01/2013 | 06/30/2014| on     |        |             |                 |
        | 2 | 51.50 | MTDC | 2015        | 07/01/2014 | 06/30/2015| on     |        |             |                 |
        | 3 | 51.50 | MTDC | 2016        | 07/01/2015 | 06/30/2016| on     |        |             |                 |
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Award Actions" document tab
    And I am fast
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  When I am in the "Validation Errors" section
  Then I should see the message "No Validation Errors present."
  When I am in the "Warnings" section
    And I should see the message "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see the "Document ID:Status" text set to ":FINAL" in the document header
    And I should see the message "Document was successfully submitted."