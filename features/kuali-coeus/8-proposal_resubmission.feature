@Proposal_Resubmission
Feature: Resubmission proposal creation and submission


  As a Central Administrator
  I want to be able to create and submit a resubmission proposal based on a pending proposal
    (do not run script #2, just #1)
  So that the proposal moves thorough the workflow and ends in an "Approved and Submitted" status

  Background:
    Given I am up top

  Scenario: Create and Submit a Resubmission Proposal


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" system tab
  When I click the "Proposal Development" search link
    And I set "Proposal Type" to "New" on the search page
    And I set "Proposal State" to "Approved and Submitted" on the search page
    And I set "Project Title" to "Test Scenario*" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I "view" the first record on the search page


  When I am on the "Proposal Actions" document tab
    And I click "Show" on the "Copy to New Document" tab
    And I check the "Budget?" checkbox
    And I set "Lead Unit" to "0710"
    And I should see the "Questionnaires?" checkbox is "checked"
    And I click the "copy proposal" button
  When I am in the "Document Overview" tab
  Then I should see "Description" set to "Garland, NIA, $500,000"
  When I am in the "Required Fields for Saving Document" tab
    And I should see "Proposal Type" set to "New"
    And I should see "Lead Unit" text set to "0710 - Cellular & Molecular Medicine"
    And I should see "Activity Type" set to "Research"
    And I should see "Project Title" set to "Test scenario: create and submit basic proposal"
    And I should see "Sponsor Code" set to "010803"
    And I should see "Project Start Date" set to "02/01/2014"
    And I should see "Project End Date" set to "01/31/2019"
  When I am in the "Document Overview" tab
    And I set "Description" to "Garland, NIH, $100,000"
    And I set "Explanation" to "Special Resubmission"
  When I am in the "Required Fields for Saving Document" tab
    And I set "Proposal Type" to "Resubmission"
    And I set "Activity Type" to "Other Sponsored Activity"
    And I set "Project Title" to "Test scenario: create and submit resubmission proposal"
    And I set "Sponsor Code" to "010806"
    And I set "Project Start Date" to "07/01/2014"
    And I set "Project End Date" to "06/30/2019"
  When I am in the "Institutional Fields Conditionally Required" section
    And I start a lookup for "Original Institutional Proposal ID"
    And I set "Proposal Type" to "New" on the search page
    And I set "Status" to "Pending" on the search page
    And I set "Project Title" to "Test Scenario*" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I "return" the first record on the search page
  Then I should see "Original Institutional Proposal ID" set to something like "000"
  When I click "Show" on the "Sponsor & Program Information" tab
    And I set "Sponsor Deadline Date" to "03/01/2014"
    And I set the "NSF Science Code" to "F.02: Biological - Life Sciences"
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Key Personnel" document tab
    And I am fast
    And I click "Show" on the "Linda L Garland" tab
    And I click "Show" on the "Person Details" subsection
  Then I should see "Percentage Effort" set to "5.00"
    And I click "Hide" on the "Linda L Garland" tab
    And I click "Show" on the "Amanda F Baker" tab
    And I click "Show" on the "Person Details" subsection
  Then I should see "Percentage Effort" set to "20.00"
    And I click "Hide" on the "Amanda F Baker" tab
    And I am in the "Combined Credit Split" tab
    And I should see Combined Credit Split for "Linda L Garland" with the following:
      | Credit for Award | 25.00 |
      | F&A Revenue      | 25.00 |
    And I fill out the Combined Credit Split for "0710 - Cellular & Molecular Medicine" under "Linda L Garland" with the following:
      | Credit for Award | 70.00  |
      | F&A Revenue      | 70.00  |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Linda L Garland" with the following:
      | Credit for Award | 30.00  |
      | F&A Revenue      | 30.00  |
    And I should see Combined Credit Split for "Amanda F Baker" with the following:
      | Credit for Award | 75.00 |
      | F&A Revenue      | 75.00 |
    And I should see Combined Credit Split for "0721 - Cancer Center Division" under "Amanda F Baker" with the following:
      | Credit for Award | 100.00 |
      | F&A Revenue      | 100.00 |
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Special Review" document tab
    And I am fast
    And I am in the "Special Review" tab
  Then I should see the "Special Review" table filled out with:
    |  #   | Type           | Approval Status |
    |  1   | Human Subjects | Approved        |
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Custom Data" document tab
    And I am fast
    And I click "Show" on the "Project Information" tab
    And I should see "Prj Location" set to "0211-0124-"
    And I should see "F&A Rate" set to "51.500"
    And I slow down by a lot
    And I click the "Save" button


  When I am on the "Questions" document tab
    And I am fast
    And I click "Show" on the "Does the Proposed Work Include any of the Following?" tab
    And I should see the "Does the Proposed Work Include any of the Following?" table filled out with:
        | #      | Answer |
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
    And I should see the "F&A (Indirect Cost) Questions" table filled out with:
        | #      | Answer |
        |  1     | No     |
        |  2     | No     |
        |  3     | No     |
    And I click "Hide" on the "F&A (Indirect Cost) Questions" tab
    And I click "Show" on the "Grants.gov Questions" tab
    And I should see the "Grants.gov Questions" table filled out with:
        | #      | Answer |
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
    And I should see the "PRS Questions" table filled out with:
        | #      | Answer |
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
  Then I should see the Budget Versions table filled out with:
      | Name          | Final Budget |
      | Version #     | 1            |
      | Direct Cost   | 330,000.00   |
      | F & A         | 170,000.00   |
      | Total         | 500,000.00   |
      | Budget Status | Incomplete   |
      | Final         | unchecked    |
    And I click "Open" on "Final Budget"
  Then I click the "Yes" button
  When I am on the "Parameters" document tab
    And I am in the "Budget Periods & Totals" tab
    And I am in the "Budget Periods" section
    And I fill out the "Budget Periods" table with:
        | #      | Period Start Date | Period End Date | Total Sponsor Cost | Direct Cost | F&A Cost |
        |  1     | 07/01/2014        | 06/30/2015      | 25000              | 15000       | 10000    |
        |  2     | 07/01/2015        | 06/30/2016      | 20000              | 10000       | 10000    |
        |  3     | 07/01/2016        | 06/30/2017      | 20000              | 10000       | 10000    |
        |  4     | 07/01/2017        | 06/30/2018      | 20000              | 10000       | 10000    |
        |  5     | 07/01/2018        | 06/30/2019      | 15000              | 10000       |  5000    |
    And I click the "Recalculate" button
  Then I should see the "Budget Periods" table filled out with:
      | #      | Period Start Date | Period End Date | Total Sponsor Cost | Direct Cost | F&A Cost  |
      |  1     | 07/01/2014        | 06/30/2015      | 25,000.00          | 15,000.00   | 10,000.00 |
      |  2     | 07/01/2015        | 06/30/2016      | 20,000.00          | 10,000.00   | 10,000.00 |
      |  3     | 07/01/2016        | 06/30/2017      | 20,000.00          | 10,000.00   | 10,000.00 |
      |  4     | 07/01/2017        | 06/30/2018      | 20,000.00          | 10,000.00   | 10,000.00 |
      |  5     | 07/01/2018        | 06/30/2019      | 15,000.00          | 10,000.00   |  5,000.00 |
    And I should see Budget Totals calculated as:
        | Period Start Date  | 07/01/2014 |
        | Period End Date    | 06/30/2019 |
        | Total Sponsor Cost | 100,000.00 |
        | Direct Cost        |  55,000.00 |
        | F&A Cost           |  45,000.00 |
        | Unrecovered F&A    |       0.00 |
        | Cost Sharing       |       0.00 |
  When I am in the "Budget Overview" tab
    And I check the "Final?" checkbox
    And I set "Budget Status" to "Complete"
    And I slow down
    And I click the "Save" button
  Then I click the "Yes" button
    And I should see the message "Document was successfully saved."
    And I click the "Return to Proposal" button


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
    And I click the "continue" button
  Then I should see "Status" text set to "Approved and Submitted" in the document header
    And I should see a message starting with "Institutional Proposal" and ending with "has been generated"