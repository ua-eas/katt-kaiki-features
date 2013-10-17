@Proposal_Renewal
Feature: Renewal proposal creation and submission

  As a Central Administrator
  I want to be able to create and submit a renewal proposal using S2S Grants.gov
  where the grants.gov unit administrator has already been established
  So that the proposal moves thorough the workflow and ends in an "Approved
  and Submitted" status and the Grants.gov status is Validated.


  Background:
    Given I am up top


  Scenario: create a renewal proposal and submit to grants.gov


  Given I am backdoored as "sandovar"
    And unit administrator has been established (see below)
    And I am on the "Central Admin" tab
  When I click the "Proposal Development" portal link
  Then I should see "Status" set to "In Progress"
  When I set the "Description" to "Garland, NIA, $750,000"
    And I set the "Proposal Type" to "Renewal (competing)"
    And I set the "Lead Unit" to "0721"
    And I set the "Activity Type" to "Research"
    And I set the "Project Title" text area to "Test scenario: create and submit renewal proposal"
    And I set the "Sponsor Code" to "010803"
  Then I should see "National Institute on Aging" under the sponsor code
  When I set the "Project Start Date" to "02/01/2019"
    And I set the "Project End Date" to "01/31/2024"
    And I start a lookup for "Award ID"
    And I set "Award Status" to "Active"
    And I set "Award Title" to "Test scenario*"
    And I click the "Search" button
  Then I should see one or more items retrieved
  When I "return" the first record
  Then I should see "Award ID" set to something like "-00001"
  When I click "Show" on the "Sponsor & Program Information" tab
    And I set "Sponsor Deadline Date" to "10/01/2018"
    And I set the "NSF Science Code" to "F.02: Biological - Life Sciences"
    And I set "Sponsor Proposal ID" to "AG012345"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Grants.gov" document tab
    And I start a lookup for "Grants.gov"
    And I set "Opportunity ID" to "CSS-120809-SF424RR-V12"
    And I click the "Search" button
    And I "return" the first record
    And I click "Show" on the "Opportunity" tab
  Then I should see "Opportunity ID" set to "CSS-120809-SF424RR-V12"
    And I should see "Opportunity Title" set to "testing new SF424 RR form"
    And I should see "Submission Type" set to "Application"
    And I should see "S2S Revision Type" set to "Select"
    And I should see "CFDA Number" set to "00.000"
    And I should see "Competition ID" set to "NEWRRFORM"
    And I should see "Closing Date" set to "12/31/2014 12:00 AM"
    And I should see "Instruction Page" set to active URL "http://at07apply.grants.gov/apply/opportunities/instructions/oppCSS-120809-SF424RR-V12-cfda00.000-cidNEWRRFORM-instructions.doc"
    And I should see "Schema URL" set to active URL "http://at07apply.grants.gov/apply/opportunities/schemas/applicant/oppCSS-120809-SF424RR-V12-cfda00.000-cidNEWRRFORM.xsd"
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Key Personnel" document tab
    And I start a lookup for "Employee"
    And I set "Last Name" to "Garland"
    And I click the "Search" button
    And I return the record with "KcPerson Id" of "112707439853"
    And I set the "Proposal Role" to "PI/Contact"
    And I click the "Add Person" button
    And I click "Show" on the "Linda L Garland" tab
    And I click "Show" on the "Person Details" section under "Linda L Garland"
    And I set "Percentage Effort" under "Linda L Garland" as "15"
    And I click "Show" on the "Unit Details" section under "Linda L Garland"
    And I set "Unit Number" to "0713"
    And I click the "Add" button
    And I click "Hide" on the "Linda L Garland" tab
    And I fill out the Combined Credit Split for "Linda L Garland" with the following:
      | Credit for Award | 100 |
      | F&A Revenue | 100 |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Linda L Garland" with the following:
      | Credit for Award | 75 |
      | F&A Revenue | 75 |
    And I fill out the Combined Credit Split for "0713 - Medicine" under "Linda L Garland" with the following:
      | Credit for Award | 25 |
      | F&A Revenue | 25 |
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Special Review" document tab
    And I set the "Type" to "Human Subjects"
    And I set the "Approval Status" to "Pending"
    And I click "Add" on "Special Review"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Custom Data" document tab
    And I click "Show" on the "Project Information" tab
    And I set "Prj Location" to "0211-0124-"
    And I set "F&A Rate" to "51.500"
    And I click the "Save" button
  Then I should not see a message at the top of the screen


  When I am on the "Questions" document tab
    And I click "Show" on the "Does the Proposed Work Include any of the Following?" tab
    And I answer the questions under "Does the Proposed Work Include any of the Following?" with:
      | # | Answer |
      | 1 | No     |
      | 2 | No     |
      | 3 | Yes    |
      | 4 | No     |
      | 5 | No     |
      | 6 | No     |
      | 7 | No     |
      | 8 | No     |
      | 9 | No     |
      | 10 | No    |
      | 11 | No    |
      | 12 | Yes   |
      | 13 | No    |
      | 14 | No    |
      | 15 | No    |
      | 16 | No    |
      | 17 | No    |
      | 18 | No    |
    And I click "Hide" on the "Does the Proposed Work Include any of the Following?" tab
    And I click "Show" on the "F&A (Indirect Cost) Questions" tab
    And I answer the questions under "F&A (Indirect Cost) Questions" with:
      | # | Answer |
      | 1 | No     |
      | 2 | No     |
      | 3 | No     |
    And I click "Hide" on the "F&A (Indirect Cost) Questions" tab
    And I click "Show" on the "Grants.gov Questions" tab
    And I answer the questions under "Grants.gov Questions" with:
      | # | Answer |
      | 1 | No     |
      | 2 | No     |
      | 3 | No     |
      | 4 | No     |
      | 5 | No     |
      | 6 | N/A    |
      | 7 | No     |
      | 8 | No     |
      | 9 | No     |
      | 10 | No    |
      | 11 | N/A   |
      | 12 | No    |
      | 13 | No    |
    And I click "Hide" on the "Grants.gov Questions" tab
    And I click "Show" on the "PRS Questions" tab
    And I answer the questions under "PRS Questions" with:
      | # | Answer |
      | 1 | No     |
      | 2 | No     |
      | 3 | No     |
    And I click "Hide" on the "PRS Questions" tab
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Budget Versions" document tab
    And I set the "Name" to "Final Budget"
    And I click "Add" on "Budget Versions"
    And I click "Open" on "Final Budget"
    And I fill out the "Budget Periods" table with:
      | # | Direct Cost | F&A Cost |
      | 1 | 99000       | 51000    |
      | 2 | 99000       | 51000    |
      | 3 | 99000       | 51000    |
      | 4 | 99000       | 51000    |
      | 5 | 99000       | 51000    |
    And I click the "Recalculate" button
  Then I should see the "Budget Periods" table filled out with:
      | # | Total Sponsor Cost | Direct Cost | F&A Cost  |
      | 1 | 150,000.00         | 99,000.00   | 51,000.00 |
      | 2 | 150,000.00         | 99,000.00   | 51,000.00 |
      | 3 | 150,000.00         | 99,000.00   | 51,000.00 |
      | 4 | 150,000.00         | 99,000.00   | 51,000.00 |
      | 5 | 150,000.00         | 99,000.00   | 51,000.00 |
    And I should see Budget Totals calculated as:
      | Period Start Date | 02/01/2019 |
      | Period End Date   | 01/31/2024 |
      | Total Sponsor Cost| 750,000.00 |
      | Direct Cost       | 495,000.00 |
      | F&A Cost          | 255,000.00 |
      | Unrecovered F&A   | 0.00       |
      | Cost Sharing      | 0.00       |
  When I check the "Final?" checkbox
    And I set "Budget Status" to "Complete"
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Return to Proposal" button


    And I am on the "Proposal Actions" document tab
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see "No Validation Errors present."
    And I should see "No Warnings present."
    And I should see "No Grants.Gov Errors present."
  When I click the "Submit" button
    And I click the "No" button
    And I wait for the document to finish being processed
  Then I should see "Status" set to "Approval Pending" in the document header
  When I click the "Blanket Approve" button
    And I wait for the document to finish being processed
  Then I should see "Status" set to "Approval Granted" in the document header
  When I click the "Submit To Sponsor" button
  Then I should see "Status" set to "Approved and Submitted" in the document header
    And I should see a message starting with "Institutional Proposal" and ending with "has been generated"


  When I am on the "Grants.gov" document tab
  When I slow down
    And I click "Show" on the "Submission Details" tab
    And I click the "Refresh" button
  Then I should see Received Date not null
    And I should see "Status" set to "VALIDATED"
    And I should see "GG Tracking Id" set to something like "GRANT00"
    And I should see "Comments" set to "VALIDATED"
    And I should see Last Modified Date not null
