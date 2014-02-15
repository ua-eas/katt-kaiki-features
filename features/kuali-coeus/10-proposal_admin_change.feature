@Proposal_Admin_Change
Feature: Administrative change proposal creation and submission

  As a Central Administrator
  I want to be able to create and submit an administrative change proposal adjusting the personnel and credit split
    (requires feature 1 and 2)
  So that the proposal moves thorough the workflow and ends in an "Approved and Submitted" status


  Background:
    Given I am up top


<<<<<<< HEAD
  Scenario: Create and Submit an Administrative Change Proposal
=======
  Scenario: create and submit an administrative change proposal
>>>>>>> development


  Given I am backdoored as "sandovar"
    And I am on the "Central Admin" system tab
  When I click the "Proposal Development" portal link
  Then I should see "Status" text set to "In Progress" in the document header
  When I am in the "Document Overview" tab
    And I set the "Description" to "Lance, NIA, $0"
  When I am in the "Required Fields for Saving Document" tab
    And I set the "Proposal Type" to "Administrative Change ($0)"
    And I set the "Lead Unit" to "0721"
    And I set the "Activity Type" to "Research"
    And I set the "Project Title" to "Test scenario: create and submit admin change proposal"
    And I set the "Sponsor Code" to "010803"
  Then I should see the "Sponsor Code" text set to "National Institute on Aging"
  When I set the "Project Start Date" to "02/01/2014"
    And I set the "Project End Date" to "01/31/2019"
  When I am in the "Institutional Fields Conditionally Required" section
    And I start a lookup for "Award ID"
    And I set "Award Status" to "Active" on the search page
    And I set "Award Title" to "Test scenario: create and submit basic proposal" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I "return" the first record on the search page
  Then I should see "Award ID" set to something like "-00001"
    And I click "Show" on the "Sponsor & Program Information" tab
    And I set "NSF Science Code" to "F.03: Medical - Life Sciences"
    And I set "Sponsor Proposal ID" to "R01AG012345"
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Key Personnel" document tab
    And I am fast
<<<<<<< HEAD
    And I am in the "Add Key Person" section
=======
>>>>>>> development
    And I start a lookup for "Employee"
    And I set "Last Name" to "Lance" on the search page
    And I click the "Search" button
    And I return the record with "KcPerson Id" of "103889007810" on the search page
    And I set "Proposal Role" to "PI/Contact"
    And I click the "Add Person" button
    And I start a lookup for "Employee"
    And I set "Last Name" to "Garland" on the search page
    And I click the "Search" button
    And I return the record with "KcPerson Id" of "112707439853" on the search page
    And I set "Proposal Role" to "Co-Investigator"
    And I click the "Add Person" button
    And I start a lookup for "Employee"
    And I set "Last Name" to "Alberts" on the search page
    And I click the "Search" button
    And I return the record with "KcPerson Id" of "112921864636" on the search page
    And I set "Proposal Role" to "Co-Investigator"
    And I click the "Add Person" button
    And I start a lookup for "Employee"
    And I set "Last Name" to "Bookman" on the search page
    And I click the "Search" button
    And I return the record with "KcPerson Id" of "108643996300" on the search page
    And I set "Proposal Role" to "Co-Investigator"
    And I click the "Add Person" button
    And I click "Show" on the "Michael P Lance" tab
    And I click "Show" on the "Person Details" subsection
    And I set "Percentage Effort" to "10"
    And I click "Hide" on the "Michael P Lance" tab
    And I click "Show" on the "David S Alberts" tab
    And I click "Show" on the "Person Details" subsection
    And I set "Percentage Effort" to "9"
    And I click "Hide" on the "David S Alberts" tab
    And I click "Show" on the "Michael A Bookman" tab
    And I click "Show" on the "Person Details" subsection
    And I set "Percentage Effort" to "8"
    And I click "Hide" on the "Michael A Bookman" tab
    And I click "Show" on the "Linda L Garland" tab
    And I click "Show" on the "Person Details" subsection
    And I set "Percentage Effort" to "7"
    And I click "Hide" on the "Linda L Garland" tab
    And I fill out the Combined Credit Split for "Michael P Lance" with the following:
      | Credit for Award | 75  |
      | F&A Revenue      | 100 |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Michael P Lance" with the following:
      | Credit for Award | 100 |
      | F&A Revenue      | 100 |
    And I fill out the Combined Credit Split for "David S Alberts" with the following:
      | Credit for Award | 15 |
      | F&A Revenue      | 0  |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "David S Alberts" with the following:
      | Credit for Award | 100 |
      | F&A Revenue      | 100 |
    And I fill out the Combined Credit Split for "Michael A Bookman" with the following:
      | Credit for Award | 5  |
      | F&A Revenue      | 0  |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Michael A Bookman" with the following:
      | Credit for Award | 100 |
      | F&A Revenue      | 100 |
    And I fill out the Combined Credit Split for "Linda L Garland" with the following:
      | Credit for Award | 5 |
      | F&A Revenue      | 0 |
    And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Linda L Garland" with the following:
<<<<<<< HEAD
        | Credit for Award | 100 |
        | F&A Revenue      | 100 |
=======
      | Credit for Award | 100 |
      | F&A Revenue      | 100 |
>>>>>>> development
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Special Review" document tab
    And I am fast
<<<<<<< HEAD
    And I am in the "Special Review" tab
=======
>>>>>>> development
    And I set the "Type" to "Human Subjects"
    And I set the "Approval Status" to "Approved"
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
<<<<<<< HEAD
    And I fill out the "Does the Proposed Work Include any of the Following?" table with:
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
    And I fill out the "F&A (Indirect Cost) Questions" table with:
            | #      | Answer |
            |  1     | No     |
            |  2     | No     |
            |  3     | No     |
    And I click "Hide" on the "F&A (Indirect Cost) Questions" tab
    And I click "Show" on the "Grants.gov Questions" tab
    And I fill out the "Grants.gov Questions" table with:
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
    And I fill out the "PRS Questions" table with:
            | #      | Answer |
            |  1     | No     |
            |  2     | No     |
            |  3     | No     |
=======
    And I answer the questions under "Does the Proposed Work Include any of the Following?" with:
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
    And I answer the questions under "F&A (Indirect Cost) Questions" with:
      | #      | Answer |
      |  1     | No     |
      |  2     | No     |
      |  3     | No     |
    And I click "Hide" on the "F&A (Indirect Cost) Questions" tab
    And I click "Show" on the "Grants.gov Questions" tab
    And I answer the questions under "Grants.gov Questions" with:
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
    And I answer the questions under "PRS Questions" with:
      | #      | Answer |
      |  1     | No     |
      |  2     | No     |
      |  3     | No     |
>>>>>>> development
    And I click "Hide" on the "PRS Questions" tab
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


  When I am on the "Budget Versions" document tab
    And I am fast
<<<<<<< HEAD
    And I am in the "Budget Versions" tab
=======
>>>>>>> development
    And I set the "Name" to "Final Budget"
    And I click "Add" on "Budget Versions"
    And I check the "Final" checkbox
    And I set "Budget Status" to "Complete"
    And I slow down
    And I click the "Save" button
  Then I should see the message "Document was successfully saved."


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
