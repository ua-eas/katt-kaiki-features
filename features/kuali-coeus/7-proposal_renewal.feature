@Proposal_Renewal
Feature: Renewal proposal creation and submission

  As a Central Administrator
  I want to be able to create and submit a renewal proposal using S2S Grants.gov
    where the grants.gov unit administrator has already been established
    So that the proposal moves thorough the workflow and ends in an "Approved
    and Submitted" status and the Grants.gov status is Validated.

  Background:
    Given I am up top

  Scenario: Create a Renewal Proposal and Submit to Grants.gov


  Given I am backdoored as "sandovar"
    And unit administrator has been established
    And I am on the "Central Admin" system tab
  When I click the "Proposal Development" portal link
  Then I should see "Status" text set to "In Progress" in the document header
  When I am in the "Document Overview" tab
    And I set the "Description" to "Garland, NIA, $750,000"
  When I am in the "Required Fields for Saving Document" tab
    And I set "Proposal Type" to "Renewal (competing)"
    And I set "Lead Unit" to "0721"
    And I set "Activity Type" to "Research"
    And I set "Project Title" to "Test scenario: create and submit renewal proposal"
    And I set "Sponsor Code" to "010803"
    And I slow down
  Then I should see "Sponsor Code" text set to "National Institute on Aging"
    And I am fast
  When I set the "Project Start Date" to "02/01/2019"
    And I set the "Project End Date" to "01/31/2024"
    And I am in the "Institutional Fields Conditionally Required" section
    And I start a lookup for "Award ID"
    And I set "Award Status" to "Active" on the search page
    And I set "Award Title" to "Test scenario*" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I "return" the first record on the search page
  Then I should see "Award ID" set to something like "-00001"
  When I click "Show" on the "Sponsor & Program Information" tab
    And I set "Sponsor Deadline Date" to "10/01/2018"
    And I set "NSF Science Code" to "F.02: Biological - Life Sciences"
    And I set "Sponsor Proposal ID" to "AG012345"
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Grants.gov" document tab
    And I am fast
    And I am in the "Grants.gov" tab
    And I am in the "Opportunity Search" section
    And I start a lookup for "Grants.gov"
    And I set "Opportunity ID" to "CSS-120809-SF424RR-V12" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I click "Show" on the "Opportunity" subsection
  Then I should see "Opportunity ID" text set to "CSS-120809-SF424RR-V12" in the "Opportunity" subsection
    And I should see "Opportunity Title" text set to "testing new SF424 RR form" in the "Opportunity" subsection
    And I should see "Submission Type" set to "Application" in the "Opportunity" subsection
    And I should see "S2S Revision Type" set to "select" in the "Opportunity" subsection
    And I should see "CFDA Number" text set to "00.000" in the "Opportunity" subsection
    And I should see "Competition Id" text set to "NEWRRFORM" in the "Opportunity" subsection
    And I should see "Closing Date" text set to "12/31/2014 12:00 AM" in the "Opportunity" subsection
    And I should see "Instruction Page" set to active URL "http://at07apply.grants.gov/apply/opportunities/instructions/oppCSS-120809-SF424RR-V12-cfda00.000-cidNEWRRFORM-instructions.doc" in the "Opportunity" subsection
    And I should see "Schema URL" set to active URL "http://at07apply.grants.gov/apply/opportunities/schemas/applicant/oppCSS-120809-SF424RR-V12-cfda00.000-cidNEWRRFORM.xsd" in the "Opportunity" subsection
    And I slow down
  When I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Key Personnel" document tab
    And I am fast
    And I am in the "Add Key Person" section
    And I start a lookup for "Employee"
    And I set "Last Name" to "Garland" on the search page
    And I click the "Search" button
    And I return the record with "KcPerson Id" of "112707439853" on the search page
    And I set the "Proposal Role" to "PI/Contact"
    And I click the "Add Person" button
    And I click "Show" on the "Linda L Garland" tab
    And I click "Show" on the "Person Details" subsection
    And I set "Percentage Effort" to "15" in the "Person Details" subsection
    And I click "Show" on the "Unit Details" subsection
    And I set "Unit Number" to "0713" in the "Unit Details" subsection
    And I click the "Add" button in the "Unit Details" subsection
    And I click "Hide" on the "Linda L Garland" tab
    And I fill out the Combined Credit Split for "Linda L Garland" with the following:
      | Credit for Award | 100 |
      | F&A Revenue      | 100 |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Linda L Garland" with the following:
      | Credit for Award | 75 |
      | F&A Revenue      | 75 |
    And I fill out the Combined Credit Split for "0713 - Medicine" under "Linda L Garland" with the following:
      | Credit for Award | 25 |
      | F&A Revenue      | 25 |
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Special Review" document tab
    And I am fast
    And I am in the "Special Review" tab
    And I set the "Type" to "Human Subjects"
    And I set the "Approval Status" to "Pending"
    And I click "Add" on "Special Review"
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Custom Data" document tab
    And I am fast
    And I click "Show" on the "Project Information" tab
    And I set "Prj Location" to "0211-0124-"
    And I set "F&A Rate" to "51.500"
    And I slow down by a lot
    And I click the "Save" button
  Then I should not see a message at the top of the screen


  When I am on the "Questions" document tab
    And I am fast
    And I click "Show" on the "Does the Proposed Work Include any of the Following?" tab
    And I fill out the "Does the Proposed Work Include any of the Following?" table with:
      | #  | Answer |
      | 1  | No     |
      | 2  | No     |
      | 3  | Yes    |
      | 4  | No     |
      | 5  | No     |
      | 6  | No     |
      | 7  | No     |
      | 8  | No     |
      | 9  | No     |
      | 10 | No     |
      | 11 | No     |
      | 12 | Yes    |
      | 13 | No     |
      | 14 | No     |
      | 15 | No     |
      | 16 | No     |
      | 17 | No     |
      | 18 | No     |
    And I click "Hide" on the "Does the Proposed Work Include any of the Following?" tab
    And I click "Show" on the "F&A (Indirect Cost) Questions" tab
    And I fill out the "F&A (Indirect Cost) Questions" table with:
      | # | Answer |
      | 1 | No     |
      | 2 | No     |
      | 3 | No     |
    And I click "Hide" on the "F&A (Indirect Cost) Questions" tab
    And I click "Show" on the "Grants.gov Questions" tab
    And I fill out the "Grants.gov Questions" table with:
      | #  | Answer |
      | 1  | No     |
      | 2  | No     |
      | 3  | No     |
      | 4  | No     |
      | 5  | No     |
      | 6  | N/A    |
      | 7  | No     |
      | 8  | No     |
      | 9  | No     |
      | 10 | No     |
      | 11 | N/A    |
      | 12 | No     |
      | 13 | No     |
    And I click "Hide" on the "Grants.gov Questions" tab
    And I click "Show" on the "PRS Questions" tab
    And I fill out the "PRS Questions" table with:
      | # | Answer |
      | 1 | No     |
      | 2 | No     |
      | 3 | No     |
    And I click "Hide" on the "PRS Questions" tab
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Budget Versions" document tab
    And I am fast
    And I am in the "Budget Versions" tab
    And I set the "Name" to "Final Budget"
    And I click "Add" on "Budget Versions"
    and I slow down
    And I click "Open" on "Final Budget"
    and I am fast
    And I am in the "Budget Periods & Totals" tab
    And I am in the "Budget Periods" section
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
    And I should see Totals calculated as:
      | Period Start Date | 02/01/2019 |
      | Period End Date   | 01/31/2024 |
      | Total Sponsor Cost| 750,000.00 |
      | Direct Cost       | 495,000.00 |
      | F&A Cost          | 255,000.00 |
      | Unrecovered F&A   | 0.00       |
      | Cost Sharing      | 0.00       |
  When I am in the "Budget Overview" tab
    And I check the "Final?" checkbox
    And I set "Budget Status" to "Complete"
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."
  When I click the "Return to Proposal" button


  When I am on the "Proposal Actions" document tab
    And I am fast
    And I click "Show" on the "Data Validation" tab
    And I click the "turn on validation" button
  Then I should see the message "No Validation Errors present."
    And I should see the message "No Warnings present."
    And I should see the message "No Grants.Gov Errors present."
  When I click the "Submit" button
    And I click the "No" button
    And I wait for the document to finish being processed
  Then I should see "Status" text set to "Approval Pending" in the document header
  When I click the "Blanket Approve" button
    And I wait for the document to finish being processed
  Then I should see "Status" text set to "Approval Granted" in the document header
  When I click the "Submit To Sponsor" button
  Then I should see "Status" text set to "Approved and Submitted" in the document header
    And I should see a message starting with "Institutional Proposal" and ending with "has been generated"


  When I am on the "Grants.gov" document tab
    And I am in the "Grants.gov" tab
    And I am in the "Opportunity Search" section
    And I slow down
    And I click "Show" on the "Submission Details" subsection
    And I click the "Refresh" button
  Then I should see Received Date not null
    And I should see "Status" text set to "VALIDATED" in the "Submission Details" subsection
    And I should see "GG Tracking Id" text set to something like "GRANT00" in the "Submission Details" subsection
    And I should see "Comments" text set to "VALIDATED" in the "Submission Details" subsection
    And I should see Last Modified Date not null