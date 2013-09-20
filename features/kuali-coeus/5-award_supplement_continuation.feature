@kc5
Feature: Award supplement/continuation creation and submission


  As a Central Administrator
  I want to be able to add cost sharing and anticipated direct costs to an existing award so that I can reflect the supplemental increase in anticipated funding


  Background:
    Given I am up top


  Scenario: Create and finalize supplement/continuation to existing award


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" tab
  When I click the "Award" search link
    And I set "Award Status" to "Active"
    And I set "Award Title" to "Test scenario:*"
    And I click the "Search" button
  Then I should see one or more items retrieved
  When I click Award ID
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
    And I set the "Comments" text area to "Mod 02A1: Yr 2 Adjusted for revised budget and cost sharing"
    And I set "Sponsor Award ID" to "R01AG012345"
    And I set "Modification ID" to "02A1"
    And I click "Save" button
  Then I should see the message "Document was successfully saved."


  When I click the "Time & Money" button
    And I click the "Edit" button at the bottom of the page
    And I set "Transaction Type" to "Continuation/Supplement"
    And I set "Notice Date" to "02/01/2015"
    And I set "Anticipated" to "550,000.00"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
    And I should see the message "Warning exists in Direct/F&A Funds Distribution section."
  When I click "Show" on the "Direct/F&A Funds Distribution" tab
    And I fill out the "Direct/F&A Funds Distribution" table with:
        |  #     | Direct Cost | F&A Cost |
        |  1     | 66000.00    | 34000.00 |
        |  2     | 116000.00   | 34000.00 |
        |  3     | 66000.00    | 34000.00 |
        |  4     | 66000.00    | 34000.00 |
        |  5     | 66000.00    | 34000.00 |
    And I click the "Recalculate" button
  Then I should see the "Direct/F&A Funds Distribution" table filled out with:
        |  #     | Direct Cost | F&A Cost  |
        |  1     | 66,000.00   | 34,000.00 |
        |  2     | 116,000.00  | 34,000.00 |
        |  3     | 66,000.00   | 34,000.00 |
        |  4     | 66,000.00   | 34,000.00 |
        |  5     | 66,000.00   | 34,000.00 |
      And I should see Total calculated as:
        |Direct Cost      | $380,000.00 |
        |F&A Cost         | $170,000.00 |
      And I should see "Total Anticipated(Direct + F&A):" set to "$550,000.00"
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to something like ":FINAL" in the document header
  When I click the "Return to Award" button
  Then I should see "Anticipated Amount" set to "$550,000.00"
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Contacts" document tab
  Then I should see the message "Document was successfully saved."


  When I am on the "Commitments" document tab
    And I click "Show" on the "Cost Sharing" tab
    And I fill out the "Cost Sharing" table with:
    | Percentage | Type             | Project Period | Source      | Destination | Commitment Amount  | Cost Share Met | Verification Date | Actions |
    |            | To Be Determined | 2              | State Funds |             | 1                  |                |                   |         |
    And I click the "Add" button
  Then I should see the "Cost Sharing" table filled out with:
    | # | Percentage | Type             | Project Period | Source      | Destination | Commitment Amount  | Cost Share Met | Verification Date | Actions |
    | 1 |            | To Be Determined | 2              | State Funds |             | 1.00               |                |                   |         |
    And I click the "Save" button
    And I should see the message "Document was successfully saved."


  When I am on the "Special Review" document tab
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Custom Data" document tab
     And I click "Show" on the "Project Information" tab
     And I click the "Save" button
  Then I should not see a message at the top of the screen


  When I am on the "Award Actions" document tab
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see "No Validation Errors present."
    And I should see "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to something like ":FINAL" in the document header
    And I should see the message "Document was successfully submitted."
