@Award_Deobligation
Feature: Award deobligation

  As a Central Administrator
  I want to be able to deobligate funding to an existing award so that I can reflect the decrease in obligated and anticipated amount


  Background:
  Given I am up top

  Scenario: Create and finalize deobligation to existing award

  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" tab


  When I click the "Award" search link
     And I set "Award Status" to "Active"
     And I set "Award Title" to "Test scenario: create and submit basic proposal"
     And I click the "Search" button
     And I click Award ID
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
     And I set "Transaction Type" to "Deobligation"
     And I set "Notice Date" to "02/15/2014"
     And I set "Comments" text area to "Mod 01A2: Yr 1 reduce Ant/Obl $50,000"
     And I set "Sponsor Award ID" to "R01AG012345"
     And I set "Modification ID" to "01A2"
     And I click "Save" button
  Then I should see the message "Document was successfully saved."


  When I click the "Time & Money" button
     And I click the "Edit" button at the bottom of the page
     And I set "Transaction Type" to "Deobligation"
     And I set "Notice Date" to "02/15/2014"
     And I click "Show" on the "Direct/F&A Funds Distribution" tab
     And I fill out the "Direct/F&A Funds Distribution" table with:
        |  #     | Direct Cost | F&A Cost |
        |  1     | 33000       | 17000    |
        |  2     | 66000       | 34000    |
        |  3     | 66000       | 34000    |
        |  4     | 66000       | 34000    |
        |  5     | 66000       | 34000    |
     And I click the "Recalculate" button
  Then I should see the "Direct/F&A Funds Distribution" table filled out with:
        |  #     | Direct Cost | F&A Cost  |
        |  1     | 33,000.00   | 17,000.00 |
        |  2     | 66,000.00   | 34,000.00 |
        |  3     | 66,000.00   | 34,000.00 |
        |  4     | 66,000.00   | 34,000.00 |
        |  5     | 66,000.00   | 34,000.00 |
     And I should see Total calculated as:
        |Direct Cost 			| $297,000.00 |
        |F&A Cost   			| $153,000.00 |
     And I should see "Total Anticipated(Direct + F&A):" set to "$450,000.00"
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."
    And I should see the message "Warning exists in Direct/F&A Funds Distribution section."
  When I set "Obligated" to "50000"
    And I set "Anticipated" to "450000"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to ":FINAL" in the document header
  When I click the "Return to Award" button


    And I am on the "Contacts" document tab
  Then I should see the message "Document was successfully saved."


  When I am on the "Commitments" document tab
    And I click "Show" on the "Rates" tab
    And I should see the "F&A Rates" table filled out with:
      | # | Rate  | Type | Fiscal Year | Start Date | End Date  | Campus | Source | Destination | Unrecovered F&A |
      | 1 | 51.50 | MTDC | 2014        | 07/01/2013 | 06/30/2014| on     |        |             |                 |
      | 2 | 51.50 | MTDC | 2015        | 07/01/2014 | 06/30/2015| on     |        |             |                 |
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Award Actions" document tab
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see "No Validation Errors present."
    And I should see "No Warnings present."
  When I click the "Submit" button
    And I wait for the document to finish being processed
  Then I should see "Document ID:Status" set to ":FINAL"
    And I should see the message "Document was successfully submitted."
