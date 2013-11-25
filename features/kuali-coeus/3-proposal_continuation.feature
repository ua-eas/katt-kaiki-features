@Proposal_Continuation
Feature: Continuation proposal creation and submission


  As a Central Administrator
  I want to be able to create and submit a basic continuation proposal with the following attributes:
    Federal Sponsor,
    No Prime,
    PI/Co-I,
    Credit Split = One Dept,
    Predominately 'No' Questions,
    Direct/Indirect Budget,
    No unrecovered F&A,
    No Cost Share,
    No Program Income,
    No Validation Warnings
    -- Human Subjects Pending,
    -- 1 Budget Period
  So that the proposal moves thorough the workflow and ends in an "Approved and Submitted" status.

  Background:
    Given I am up top

  Scenario: Create and Submit Continuation Proposal


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" system tab
  When I click the "Proposal Development" portal link
  Then I should see the "Status" text set to "In Progress" in the document header
  When I am in the "Document Overview" tab
    And I set the "Description" to "Garland, NIA, $100,000"
  When I am in the "Required Fields for Saving Document" tab
    And I set the "Proposal Type" to "Continuation (non-competing, previously routed)"
    And I set the "Lead Unit" to "0721"
    And I set the "Activity Type" to "Research"
    And I set the "Project Title" to "Test scenario: create and submit continuation proposal"
    And I set the "Sponsor Code" to "010803"
    And I slow down
	Then I should see the "Sponsor Code" text set to "National Institute on Aging"
    And I am fast
  When I set the "Project Start Date" to "02/01/2015"
    And I set the "Project End Date" to "01/31/2016"
    And I am in the "Institutional Fields Conditionally Required" section
    And I start a lookup for "Award ID"
    And I set "Award Status" to "Active" on the search page
    And I set "Award Title" to "Test scenario: create and submit basic proposal" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I "return" the first record on the search page
  Then I should see "Award ID" set to something like "-00001"
  When I click "Show" on the "Sponsor & Program Information" tab
    And I set "Sponsor Deadline Date" to "10/01/2014"
    And I set the "NSF Science Code" to "F.02: Biological - Life Sciences"
    And I set "Sponsor Proposal ID" to "AG012345"
    And I slow down
    And I click "Save" button
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
    And I start a lookup for "Employee"
    And I set "Last Name" to "Baker" on the search page
    And I click the "Search" button
    And I return the record with "KcPerson Id" of "108464956880" on the search page
    And I set "Proposal Role" to "Co-Investigator"
    And I click the "Add Person" button
    And I click "Show" on the "Linda L Garland" tab
    And I click "Show" on the "Person Details" subsection
    And I set "Percentage Effort" to "5"
    And I click "Hide" on the "Linda L Garland" tab
    And I click "Show" on the "Amanda F Baker" tab
    And I click "Show" on the "Person Details" subsection
    And I set "Percentage Effort" to "30"
    And I click "Hide" on the "Amanda F Baker" tab
    And I fill out the Combined Credit Split for "Linda L Garland" with the following:
      | Credit for Award | 10 |
      | F&A Revenue      | 10 |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Linda L Garland" with the following:
      | Credit for Award | 100 |
      | F&A Revenue      | 100 |
    And I fill out the Combined Credit Split for "Amanda F Baker" with the following:
      | Credit for Award | 90 |
      | F&A Revenue      | 90 |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Amanda F Baker" with the following:
      | Credit for Award | 100 |
      | F&A Revenue      | 100 |
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Special Review" document tab
    And I am fast
    And I am in the "Special Review" tab
    And I set the "Type" to "Human Subjects"
    And I set the "Approval Status" to "Pending"
    And I set the "Application Date" to "09/01/2014"
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


  When I am on the "Questions" document tab
    And I am fast
    And I click "Show" on the "Does the Proposed Work Include any of the Following?" tab
    And I fill out the "Does the Proposed Work Include any of the Following?" table with:
      |  #     | Answer |
      |  1     | No     |
      |  2     | No     |
      |  3     | Yes    |
      |  4     | No     |
      |  5     | No     |
      |  6     | No     |
      |  7     | No     |
      |  8     | No     |
      |  9     | No     |
      | 10     | No     |
      | 11     | No     |
      | 12     | Yes    |
      | 13     | No     |
      | 14     | No     |
      | 15     | No     |
      | 16     | No     |
      | 17     | No     |
      | 18     | No     |
    And I click "Hide" on the "Does the Proposed Work Include any of the Following?" tab
    And I click "Show" on the "F&A (Indirect Cost) Questions" tab
    And I fill out the "F&A (Indirect Cost) Questions" table with:
      |  #     | Answer |
      |  1     | No     |
      |  2     | No     |
      |  3     | No     |
    And I click "Hide" on the "F&A (Indirect Cost) Questions" tab
    And I click "Show" on the "Grants.gov Questions" tab
    And I fill out the "Grants.gov Questions" table with:
      |  #     | Answer |
      |  1     | No     |
      |  2     | No     |
      |  3     | No     |
      |  4     | No     |
      |  5     | No     |
      |  6     | N/A    |
      |  7     | No     |
      |  8     | No     |
      |  9     | No     |
      | 10     | No     |
      | 11     | N/A    |
      | 12     | No     |
      | 13     | No     |
    And I click "Hide" on the "Grants.gov Questions" tab
    And I click "Show" on the "PRS Questions" tab
    And I fill out the "PRS Questions" table with:
      |  #     | Answer |
      |  1     | No     |
      |  2     | No     |
      |  3     | No     |
    And I click "Hide" on the "PRS Questions" tab
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Budget Versions" document tab
    And I am fast
    And I am in the "Budget Versions" tab
    And I set the "Name" to "Final Budget"
    And I click "Add" on "Budget Versions"
    And I slow down
    And I click "Open" on "Final Budget"
    And I am fast
    And I am in the "Budget Periods & Totals" tab
    And I am in the "Budget Periods" section
    And I fill out the "Budget Periods" table with:
      |  #     | Direct Cost | F&A Cost |
      |  1     | 66000       | 34000    |
    And I click the "Recalculate" button
  Then I should see the "Budget Periods" table filled out with:
    |  #     | Total Sponsor Cost | Direct Cost | F&A Cost  |
    |  1     | 100,000.00         | 66,000.00   | 34,000.00 |
    And I should see Totals calculated as:
      | Period Start Date  | 02/01/2015 |
      | Period End Date    | 01/31/2016 |
      | Total Sponsor Cost | 100,000.00 |
      | Direct Cost        |  66,000.00 |
      | F&A Cost           |  34,000.00 |
      | Unrecovered F&A    |       0.00 |
      | Cost Sharing       |       0.00 |
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
    And I am in the "Resubmission Options" tab
    And I click the "Generate a new Institutional Proposal" radio button
    And I click the "Continue" button
  Then I should see "Status" text set to "Approved and Submitted" in the document header
    And I should see a message starting with "Institutional Proposal" and ending with "has been generated"


  When I am on the "Medusa" document tab
    And I am in the "Medusa" tab
  Then I should see the link for "Institutional Proposal"
    And I should see the link for "Development Proposal"
    And I should see the link for "Award"
    And I should see the link for "Institutional Proposal"
    And I should see "Status" text set to "Approved and Submitted" in the "Development Proposal" subsection
    And I should see "Start Date" text set to "02/01/2015" in the "Development Proposal" subsection
    And I should see "End Date" text set to "01/31/2016" in the "Development Proposal" subsection
    And I should see the link for "Award"
  When I click the "Open Proposal" button in the "Development Proposal" subsection


  Then a new browser window appears
  When I am on the "Proposal" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Grants.gov" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Key Personnel" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Special Review" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Custom Data" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Abstracts and Attachments" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Questions" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Budget Versions" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Permissions" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Proposal Actions" document tab
  Then I should see the message "Document was successfully reloaded."


  When I am on the "Medusa" document tab
  Then I should see the message "Document was successfully reloaded."