Feature: proposal creation and submission

  As a Central Administrator
  I want to be able to create and submit a basic proposal with the following attributes:
    Federal Sponsor, No Prime, PI/Co-I, 
    Credit Split = One Dept, Human Subjects, 
    Predominately 'No' Questions, 
    Direct/Indirect Budget, 5 Budget Periods,
    No Unrecovered F&A, No Cost Share, No Program
    Income, No Validation Warnings
  So that  the proposal moves through the workflow and ends in an "Approved and Submitted" status.

  Background:
    Given I am up top

  Scenario: create and submit basic proposal

    Given I am backdoored as "sandovar"
      And I am on the "Central Admin" tab
    When I click the "Proposal Development" portal link
    Then I should see "Status" set to "In Progress" in the document header
    When I set the "Description" to "Garland, NIA, $500,000"
      And I set the "Proposal Type" to "New"
      And I set the "Lead Unit" to "0721"
      And I set the "Activity Type" to "Research"
      And I set the "Project Title" to something like "Test scenario: create and submit basic proposal"
      And I set the "Sponsor Code" to "010803"
    Then I should see "National Institute on Aging" under under the sponsor code
    When I set the "Project Start Date" to "02/01/2014"
      And I set the "Project End Date" to "01/31/2019"
      And I show the "Sponsor & Program Information" tab
      And I set "Sponsor Deadline Date" to "10/01/2013"
      And I set "NSF Science Code" to "F.03 Medical - Life Sciences"
      And I click the "Save" button
    Then I should see the message "Document was successfully saved."
      And I should see "Sponsor Name" set to "National Institute on Aging" in the document header 
    When I select the "Key Personel" tab at the top of the document
      And I start a lookup for "Employee Search"
      And I set the "Last Name" to "Garland"
      And I click "search"
      And I return the record with "KcPerson ID" of "112707439853"
      And I set the "Proposal Role" to "PI/Contact"
      And I click the "Add Person" button
      And I start a lookup for "Employee Search"
      And I set the "Last Name" to "Baker"
      And I click "search"
      And I return the record with "KcPerson ID" of "108464956880"
      And I set the "Proposal Role" to "Co-Investigator"
      And I click the "Add Person" button
      And I show the "PI/Contact" tab
      And I show the "Person Details" for "Linda L Garland"
      And I set the "Percentage Effort" to "5"
      And I hide the "PI/Contact" tab
      And I show the "Co-Investigator" tab
      And I show the "Person Details" for "Amanda F Baker"
      And I set the "Percentage Effort" to "20"
      And I hide the "Co-Investigator" tab
      And I fill out the Combined Credit Split for "Linda L Garland" with the following:
        | Credit for Award | 25 |
        | F&A Revenue      | 25 |
      And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Linda L Garland" with the following:
        | Credit for Award | 100 |
        | F&A Revenue      | 100 |
      And I fill out the Combined Credit Split for "Amanda F Baker" with the following:
        | Credit for Award | 75 |
        | F&A Revenue      | 75 |
      And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Amanda F Baker" with the following:
        | Credit for Award | 100 |
        | F&A Revenue      | 100 |
      And I click the "Save" button
    Then I should see the message "Document was successfully saved."
    When I select the "Special Review" tab at the top of the document
      And I set "Type" to "Human Subjects"
      And I set "Approval Status" to "Approved"
      And I click "Add"
      And I click the "Save" button
    Then I should see the message "Document was successfully saved."
    When I select the "Custom Data" tab at the top of the document
      And I show the "Project Information" tab
      And I set "Prj Location (Bldg#-Rm#-Other)" to "0211-0124-"
      And I set "F&A Rate % (ex: 51.000/51.500)" to "51.500"
      And I click the "Save" button
      And I select the "Questions" tab at the top of the document
      And I show the "Does the Proposed Work Include any of the Following?" tab
      And I answer the questions under "Does the Proposed Work Include any of the Following?" with:
        |  # | Answer |
        |  1 |     No |
        |  2 |     No |
        |  3 |    Yes |
        |  4 |     No |
        |  5 |     No |
        |  6 |     No |
        |  7 |     No |
        |  8 |     No |
        |  9 |     No |
        | 10 |     No |
        | 11 |     No |
        | 12 |    Yes |
        | 13 |     No |
        | 14 |     No |
        | 15 |     No |
        | 16 |     No |
        | 17 |     No |
        | 18 |     No |
      And I hide the "Does the Proposed Work Include any of the Following?" tab
      And I show the "F&A (Indirect Cost) Questions" tab
      And I answer the questions under "F&A (Indirect Cost) Questions" with:
        |  # | Answer |
        |  1 |     No |
        |  2 |     No |
        |  3 |     No |
      And I hide the "F&A (Indirect Cost) Questions" tab
      And I show the "Grants.gov Questions" tab
      And I answer the questions under "Grants.gov Questions" with:
        |  # | Answer |
        |  1 |     No | 
        |  2 |     No | 
        |  3 |     No | 
        |  4 |     No | 
        |  5 |     No | 
        |  6 |    N/A | 
        |  7 |     No | 
        |  8 |     No | 
        |  9 |     No | 
        | 10 |     No | 
        | 11 |    N/A | 
        | 12 |     No | 
        | 13 |     No | 
      And I hide the "Grants.gov Questions" tab
      And I show the "PRS Questions" tab
      And I answer the questions under "PRS Questions" with:
        |  # | Answer |
        |  1 |     No | 
        |  2 |     No | 
        |  3 |     No | 
      And I hide the "PRS Questions" tab
      And I click the "Save" button
    Then I should see the message "Document was successfully saved."
    When I select the "Budget Versions" tab at the top of the document
      And I set "Name" to "Final Budget"
      And I click "Add"
      And I click "Open" on "Final Budget"
      And I fill out line "1" of the Budget Periods table with:
        | Direct Cost | 66000 |
        | F&A Cost    | 34000 |
      And I fill out line "2" of the Budget Periods table with:
        | Direct Cost | 66000 |
        | F&A Cost    | 34000 |
      And I fill out line "3" of the Budget Periods table with:
        | Direct Cost | 66000 |
        | F&A Cost    | 34000 |
      And I fill out line "4" of the Budget Periods table with:
        | Direct Cost | 66000 |
        | F&A Cost    | 34000 |
      And I fill out line "5" of the Budget Periods table with:
        | Direct Cost | 66000 |
        | F&A Cost    | 34000 |
      And I click "Recalculate"
    Then I should see line "1" of the Budget Periods table filled out with:
      | Total Sponsor Cost | 100,000.00 |
      | Direct Cost        | 66,000.00  |
      | F&A Cost           | 34,000.00  |
      And I should see line "2" of the Budget Periods table filled out with:
        | Total Sponsor Cost | 100,000.00 |
        | Direct Cost        | 66,000.00  |
        | F&A Cost           | 34,000.00  |
      And I should see line "3" of the Budget Periods table filled out with:
        | Total Sponsor Cost | 100,000.00 |
        | Direct Cost        | 66,000.00  |
        | F&A Cost           | 34,000.00  |
      And I should see line "4" of the Budget Periods table filled out with:
        | Total Sponsor Cost | 100,000.00 |
        | Direct Cost        | 66,000.00  |
        | F&A Cost           | 34,000.00  |
      And I should see line "5" of the Budget Periods table filled out with:
        | Total Sponsor Cost | 100,000.00 |
        | Direct Cost        | 66,000.00  |
        | F&A Cost           | 34,000.00  |
      And I should see Budget Totals calculated as:
        | Period Start Date  | 02/01/2014 |
        | Period End Date    | 01/31/2019 |
        | Total Sponsor Cost | 500,000.00 |
        | Direct Cost        | 330,000.00 |
        | F&A Cost           | 170,000.00 |
        | Unrecovered F&A    |       0.00 |
        | Cost Sharing       |       0.00 |
      And I check the "Final?" checkbox
      And I set "Budget Status" to "Complete"
      And I click the "Save" button
    Then I should see the message "Document was successfully saved."
    When I click "Return to Proposal"
      And I select the "Proposal Actions" tab at the top of the document
      And I show the "Data Validation" tab
      And I click the "turn on validation" button
    Then I should see "No Validation Errors present."
      And I should see "No Warnings present."
      And I should see "No Grants.Gov Errors present."
    And I click the "Submit" button
      And I click "no"
      And I wait for the document to finish being processed
    Then I should see "Status" set to "Approval Pending" in the document header
    When I click the "Blanket Approval" button
      And I wait for the document to finish being processed
    Then I should see "Status" set to "Approval Granted" in the document header
    When I click the "submit to sponsor" button
    Then I should see "Status" set to "Approved and Submitted" in the document header
      And I should see a message starting with "Institutional Proposal" and ending with "has been generated"
