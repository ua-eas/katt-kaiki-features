@Award_New
Feature: Award creation and submission


  As a Central Administrator
  I want to be able to create a new award based on an existing institutional proposal with the following attributes:
    Federal Sponsor,
    One year Obligated,
    Five years Anticipated,
    Time & Money Document
  So that the award moves through the workflow and ends in "Final" status.

  Background:
    Given I am up top

  Scenario: Create and Finalize New Award


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" system tab
    When I click the "Award" portal link
  Then I should see "Document ID:Status" text set to ":INITIATED" in the document header
  When I am in the "Document Overview" tab
    And I set the "Description" to "Garland, NIA, 3001500"
    And I click "Show" on the "Funding Proposals" tab
    And I start a lookup for "Institutional Proposal ID"
    And I set "Proposal Type" to "New" on the search page
    And I set "Status" to "Pending" on the search page
    And I set "Project Title" to "Test scenario: create and submit basic proposal" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I "return" the first record on the search page
    And I click "Add" on "Funding Proposals"
  Then I should see "PI" text set to "Linda L Garland" in the document header
    And I should see "Lead Unit" text set to "Cancer Center Division" in the document header
    And I should see "Sponsor Name" text set to "National Institute on Aging" in the document header
  When I am in the "Current Funding Proposals" section
  Then I should see the Current Funding Proposals table filled out with:
    | Award Version         | 1                           |
    | Principal Investigator| Linda L Garland             |
    | Lead Unit             | 0721                        |
    | Lead Unit             | Cancer Center Division      |
    | Proposed Sponsor      | 010803                      |
    | Proposed Sponsor      | National Institute on Aging |
    | Proposed Start Date   | 02/01/2014                  |
    | Proposed End Date     | 01/31/2019                  |
    | Total Costs           | $500,000.00                 |
  When I am in the "Details & Dates" tab
    And I am in the "Details and Dates" section
  Then I should see "Award Title" set to "Test scenario: create and submit basic proposal" in the "Institution" subsection
    And I should see "Lead Unit ID" set to "0721" in the "Institution" subsection
    And I should see "Activity Type" set to "Research" in the "Institution" subsection
    And I should see "Sponsor ID" set to "010803" in the "Sponsor" subsection
    And I should see "Sponsor ID" text set to "National Institute on Aging" in the "Sponsor" subsection
    And I should see "NSF Science Code" set to "F.03: Medical - Life Sciences" in the "Sponsor" subsection
  When I set "Transaction Type" to "New" in the "Current Action" subsection
    And I set the "Notice Date" to "01/01/2014" in the "Current Action" subsection
    And I set the "Comments" to "New award: Ant/Obl $500,000.00 02/01/2014-01/31/2019" in the "Current Action" subsection
    And I set the "Award Status" to "Active" in the "Institution" subsection
    And I set the "Account ID" to "3001500" in the "Institution" subsection
    And I set the "Award Type" to "Grant" in the "Institution" subsection
    And I set the "Sponsor Award ID" to "1R01AG012345-01" in the "Sponsor" subsection
    And I set the "Modification ID" to "01" in the "Sponsor" subsection
    And I set the "CFDA Number" to "93.866" in the "Sponsor" subsection
    And I set the "NSF Science Code" to "F.02: Biological - Life Sciences" in the "Sponsor" subsection
    And I set the "Project Start Date" to "02/01/2014" in the "Time & Money" subsection
    And I set the "Project End Date" to "01/31/2019" in the "Time & Money" subsection
    And I set the "Execution Date" to "12/15/2013" in the "Time & Money" subsection
    And I click "Show" on the "Sponsor Template" tab
    And I start a lookup for "Sponsor Template Code"
    And I click the "search" button
    And I return the record with "Sponsor Template Code" of "1" on the search page
  Then I should see "Description" text set to "To Be Determined"
  When I click "Apply" on "Sponsor Template"
    And I click "Yes" to "Are you sure you want to apply this Sponsor Template?"
    And I click "No" to "Cost Share information is already defined in this award.  Do you want to replace current Cost Share information with selected To Be Determined template information?"
    And I slow down
    And I click "Save" button
  Then I should see the message "Document was successfully saved."
    And I should see "Document ID:Status" text set to ":SAVED" in the document header
    And I should see "Award ID: Account:" text set to "-00001:3001500" in the document header
    And I should see "Last Update" text set to "by sandovar" in the document header


  When I click the "Time & Money" button
    And I am fast
    And I am in the "Award Hierarchy" tab
  Then I should see "Project End" set to "01/31/2019"
  When I set the "Oblg. Start" to "02/01/2014"
    And I set the "Oblg. End" to "01/31/2015"
    And I set "Transaction Type Code" to "New"
    And I set "Notice Date" to "01/01/2014"
    And I click the "save" button
  Then I should see the message "Document was successfully saved."
  When I click "Show" on the "Direct/F&A Funds Distribution" tab
    And I fill out the "Direct/F&A Funds Distribution" table with:
      |  #     | Direct Cost | F&A Cost |
      |  1     | 66000       | 34000    |
      |  2     | 66000       | 34000    |
      |  3     | 66000       | 34000    |
      |  4     | 66000       | 34000    |
      |  5     | 66000       | 34000    |
    And I click the "Recalculate" button
  Then I should see the "Direct/F&A Funds Distribution" table filled out with:
      |  #     | Direct Cost | F&A Cost  |
      |  1     | 66,000.00   | 34,000.00 |
      |  2     | 66,000.00   | 34,000.00 |
      |  3     | 66,000.00   | 34,000.00 |
      |  4     | 66,000.00   | 34,000.00 |
      |  5     | 66,000.00   | 34,000.00 |
    And I should see Total calculated as:
      |Direct Cost 			| $330,000.00 |
      |F&A Cost   			| $170,000.00 |
    And I should see "Total Anticipated(Direct + F&A):" text set to "$500,000.00"
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."
    And I should see the message "Warning exists in Direct/F&A Funds Distribution section."
  When I am in the "Award Hierarchy" tab
    And I set "Obligated" to "100000"
    And I set "Anticipated" to "500000"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" text set to ":FINAL" in the document header
  When I click the "Return to Award" button


  When I am on the "Contacts" document tab
    And I click "Show" on the "Key Personnel and Credit Split" tab
  Then I should see the "Key Personnel" table filled out with:
    | line  | Person          | Unit                   | Project Role    | Office Phone | Email                     |
    | 1     | Linda L Garland | Cancer Center Division | PI/Contact      | 520-626-3434 | lgarland@azcc.arizona.edu |
    | 2     | Amanda F Baker  | Cancer Center Division | Co-Investigator | 520-626-0301 | abaker@azcc.arizona.edu   |
  When I click "Show" on the "Person Details" subsection under "Linda L Garland"
  Then I should see "Total Effort" set to "5.00" in the "Person Details" subsection for "Linda L Garland"
  When I click "Hide" on the "Person Details" subsection under "Linda L Garland"
    And I click "Show" on the "Person Details" subsection under "Amanda F Baker"
  Then I should see "Total Effort" set to "20.00" in the "Person Details" subsection for "Amanda F Baker"
  When I click "Hide" on the "Person Details" subsection under "Amanda F Baker"
    And I click "Show" on the "Unit Details" subsection under "Linda L Garland"
  Then I should see "Unit Name" set to "Cancer Center Division" in the "Unit Details" subsection for "Linda L Garland"
    And I should see "Unit Number" set to "0721" in the "Unit Details" subsection for "Linda L Garland"
  When I click "Hide" on the "Unit Details" subsection under "Linda L Garland"
    And I click "Show" on the "Unit Details" subsection under "Amanda F Baker"
  Then I should see "Unit Name" set to "Cancer Center Division" in the "Unit Details" subsection for "Amanda F Baker"
    And I should see "Unit Number" set to "0721" in the "Unit Details" subsection for "Amanda F Baker"
  When I click "Hide" on the "Unit Details" subsection under "Amanda F Baker"
    And I fill out the Combined Credit Split for "Linda L Garland" with the following:
      | Credit for Award | 20 |
      | F&A Revenue      | 20 |
    And I fill out the Combined Credit Split for "Amanda F Baker" with the following:
      | Credit for Award | 80 |
      | F&A Revenue      | 80 |
    And I click the "Recalculate" button
  Then I should see Combined Credit Split for "Linda L Garland" with the following:
      | Credit for Award | 20.00 |
      | F&A Revenue      | 20.00 |
    And I should see Combined Credit Split for "Amanda F Baker" with the following:
      | Credit for Award | 80.00 |
      | F&A Revenue      | 80.00 |
  When I click "Show" on the "Sponsor Contacts" tab
  Then I should see the Sponsor Contacts table filled out with:
    | Person or Organization | Last Name TBD, First Name TBD Middle Name TBD |
    | Project Role           | Other                                         |
    And I slow down
  When I click the "Save" button
    Then I should see the message "Document was successfully saved."


  When I am on the "Commitments" document tab
    And I am fast
    And I click "Show" on the "Rates" tab
    And I am in the "F&A Rates" section
    And I set the "Rate" to "51.50"
    And I set the "Type" to "MTDC"
    And I set the "Fiscal Year" to "2014"
  When I slow down
  Then I should see "Start Date" as "07/01/2013"
    And I should see "End Date" as "06/30/2014"
    And I should see "Campus" as "on"
  When I click "Add" button
    And I set the "Rate" to "51.50"
    And I set "Type" to "MTDC"
    And I set the "Fiscal Year" to "2015"
  Then I should see "Start Date" as "07/01/2014"
    And I should see "End Date" as "06/30/2015"
    And I should see "Campus" as "on"
  When I am fast
  When I click "Add" button
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Special Review" document tab
    And I am fast
    And I am in the "Special Review" tab
  Then I should see the "Special Review" table filled out with:
    |  #   | Type           | Approval Status |
    |  1   | Human Subjects | Approved        |
  When I fill out the "Special Review" table with:
    |  #   | Approval Date |
    |  1   | 01/15/2014    |
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Custom Data" document tab
    And I am fast
    And I click "Show" on the "Project Information" tab
  Then I should see "Prj Location (Bldg#-Rm#-Other):" set to "0211-0124-"
    And I should see "F&A Rate" set to "51.500"
    And I slow down by a lot
  When I click the "Save" button


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