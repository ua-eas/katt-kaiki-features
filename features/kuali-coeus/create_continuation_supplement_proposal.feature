Feature: Revision proposal creation and submission

As a Central Administrator
I want to be able to create and submit a basic revision proposal with the following attributes:
Federal Sponsor, No Prime, PI/Co-I x2, Credit Split = One Dept, 'Yes' Question with date and explanation,
NonPersonnel Budget w/ 2 line items, No unrecovered F&A, No Cost Share, No Program Income, No Validation Warnings, 1 Budget Period

So that the proposal moves thorough the workflow and ends in an "Approved and Submitted" status.

Background:
Given I am up top

Scenario: create and submit revision proposal

Given I am backdoored as "sandovar"
  And I am on the "Central Admin" tab

When I click the "Proposal Development" portal link
Then I should see "Status" set to "In Progress"

When I set the "Description" to "Garland, NIA, $25,000"
  And I set the "Proposal Type" to "Revision"
  And I set the "Lead Unit" to "0721"
  And I set the "Activity Type" to "Research"
  And I set the "Project Title" to something like "Test scenario: create and submit revision proposal"
  And I set the "Sponsor Code" to "010803"
Then I should see "National Institute on Aging" under the sponsor code

When I set the "Project Start Date" to "02/01/2015"
  And I set the "Project End Date" to "01/31/2016"
  And I start a lookup for "Award ID"
  And I set "Award Status" to "Active"
  And I set "Award Title" to "Test scenario: create and submit basic proposal"
  And I click the "Search" button
Then I should see one or more items retrieved

When I return the first record
Then I should see "Award ID" set to something like "-00001"

When I click "Show" on the "Sponsor & Program Information" tab
  And I set "Sponsor Deadline Date" to "11/01/2015"
  And I set the "NSF Science Code" to "F.02: Biological - Life Sciences"
  And I set "Sponsor Proposal ID" to "AG012345"
  And I click "Save" button
Then I should see the message "Document was successfully saved."

When I am on the "Key Personnel" document tab
  And I click the "Employee Search Lookup" button
  And I set "Last Name" to "Garland"
  And I click the "Search" button
  And I return the record with "KcPerson Id" of "112707439853" 
  And I set the "Proposal Role" to "PI/Contact"
  And I click the "Add Person" button
  And I click the "Employee Search Lookup" button
  And I set "Last Name" to "Baker"
  And I click the "Search" button
  And I return the record with "KcPerson Id" of "108464956880"
  And I set "Proposal Role" to "Co-Investigator"
  And I click the "Add Person" button
  And I click the "Employee Search Lookup" button
  And I set "Last Name" to "Lukach"
  And I click the "Search" button
  And I return the record with "KcPerson Id" of "100159980863"
  And I set "Proposal Role" to "Co-Investigator"
  And I click the "Add Person" button
  And I check the "Heather D Lukach" checkbox
  And I click the "Delete Selected" button
  And I click the "Employee Search Lookup" button
  And I set "Last Name" to "Lukach"
  And I click the "Search" button
  And I return the record with "KcPerson Id" of "107759802287"
  And I set "Proposal Role" to "Co-Investigator"
  And I click the "Add Person" button
  And I click "Show" on the "Linda L Garland" tab
  And I click "Show" on the "Person Details" section
  And I set "Percentage Effort" for "Linda L Garland" as "5"
  And I click "Hide" on the "Linda L Garland" tab
  And I click "Show" on the "Amanda F Baker" tab
  And I click "Show" on the "Person Details" section
  And I set "Percentage Effort" for "Amanda F Baker" as "30"
  And I click "Hide" on the "Amanda F Baker" tab
  And I click "Show" on the "Michael D Lukach" tab
  And I click "Show" on the "Person Details" section
  And I set "Percentage Effort" for "Michael D Lukach" as "25"
  And I click "Hide" on the "Michael D Lukach" tab
  And I fill out the Combined Credit Split for "Linda L Garland" with the following:	
    | Credit for Award | 10 |
    | F&A Revenue      | 10 |
  And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Linda L Garland" with the following:
    | Credit for Award | 100 |
    | F&A Revenue      | 100 |
  And I fill out the Combined Credit Split for "Amanda F Baker" with the following:
    | Credit for Award | 50 |
    | F&A Revenue      | 50 |
  And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Amanda F Baker" with the following:
    | Credit for Award | 100 |
    | F&A Revenue      | 100 |
  And I fill out the Combined Credit Split for "Michael D Lukach" with the following:
    | Credit for Award | 40 |
    | F&A Revenue      | 40 |
  And I fill out the Combined Credit Split for "0721 - Cancer Center Division" under "Michael D Lukach" with the following:
    | Credit for Award | 100 |
    | F&A Revenue      | 100 |
  And I click the "Save" button
Then I should see the message "Document was successfully saved."

When I am on the "Special Review" document tab
  And I set the "Type" to "Human Subjects"
  And I set the "Approval Status" to "Pending"
  And I click the "Add" button on the "Special Review" tab
  And I click the "Save" button
Then I should see the message "Document was successfully saved."

When I click the "Delete" button for row 1
Then I should see the message "Are you sure you want to delete this Special Review?"
 
When I click the "Yes" button
Then I should not see row 1
  
When I click the "Save" button
Then I should see the message "Document was successfully saved."

When I am on the "Custom Data" document tab
  And I click "Show" on the "Project Information" tab
  And I set "Prj Location" to "0211-"
  And I set "F&A Rate" to "51.5"
  And I click the "Save" button 
Then I should not see a message at the top of the screen

When I am on the "Questions" document tab
  And I click "Show" on the "Does the Proposed Work Include any of the Following?" tab
  And I answer the questions under "Does the Proposed Work Include any of the Following?" with:
          | #      | Answer | Review Date | Explanation |
          |  1     | No     |             |             |
          |  2     | No     |             |             |
          |  3     | Yes    |             |             |
          |  4     | No     |             |             |
          |  5     | No     |             |             |
          |  6     | No     |             |             |
          |  7     | No     |             |             |
          |  8     | No     |             |             |
          |  9     | No     |             |             |
          | 10     | No     |             |             |
          | 11     | No     |             |             |
          | 12     | Yes    |             |             |
          | 13     | No     |             |             |
          | 14     | No     |             |             |
          | 15     | No     |             |             |
          | 16     | No     |             |             |
          | 17     | No     |             |             |
          | 18     | No     |             |             |
  And I click "Hide" on the "Does the Proposed Work Include any of the Following?" tab
  And I click "Show" on the "F&A (Indirect Cost) Questions" tab
  And I answer the questions under "F&A (Indirect Cost) Questions" with:
          | #      | Answer | Review Date | Explanation |
          |  1     | No     |             |             |
          |  2     | No     |             |             |
          |  3     | No     |             |             |
  And I click "Hide" on the "F&A (Indirect Cost) Questions" tab
  And I click "Show" on the "Grants.gov Questions" tab
  And I answer the questions under "Grants.gov Questions" with:
          | #      | Answer | Review Date | Explanation                 |
          |  1     | No     |             |                             |
          |  2     | No     |             |                             | 
          |  3     | No     |             |                             | 
          |  4     | No     |             |                             | 
          |  5     | No     |             |                             | 
          |  6     | N/A    |             |                             | 
          |  7     | No     |             |                             | 
          |  8     | No     |             |                             | 
          |  9     | Yes    | 11/01/2015  |see attached progress report |
          | 10     | No     |             |                             | 
          | 11     | N/A    |             |                             |
          | 12     | No     |             |                             | 
          | 13     | No     |             |                             |
  And I click "Hide" on the "Grants.gov Questions" tab
  And I click "Show" on the "PRS Questions" tab
  And I answer the questions under "PRS Questions" with:
          | #      | Answer | Review Date | Explanation |
          |  1     | No     |             |             |
          |  2     | No     |             |             | 
          |  3     | No     |             |             |
  And I click "Hide" on the "PRS Questions" tab
  And I click the "Save" button
Then I should see the message "Document was successfully saved."

When I am on the "Budget Versions" document tab
  And I set the "Name" to "Final Budget"
  And I click the "Add" button on the "Budget Versions" tab
  And I click "Open" on "Final Budget"
Then I should see the "Budget Periods" table empty:
          |  #     | Total Sponsor Cost | Direct Cost | F&A Cost  | 
          |  1     | 0.00               | 0.00        | 0.00      |

When I am on the "Non-Personnel" document tab
  And I click "Show" on the "Travel" tab
  And I fill out the "Travel" table with:
          |Object Code Name      | Description | Quantity | Total Base Cost |
	  |Travel - Out of State | conference  |          | 5000            |      
  And I click the "Add" button
Then I should see the "Travel" table with:
	  |Object Code Name           | Description | Quantity | Total Base Cost |
	  |Travel - Out of State 6240 | conference  |          | 5,000.00        | 
  And I click "Show" on "Line Item Details"
  And I should see "State Date" set to "02/01/2015"
  And I should see "End Date" set to "01/31/2016"
  And I should see "Budget Category" set to "Travel - Domestic"
  And I check the "Apply Inflation?" checkbox
  And I click "Hide" on the "Travel" tab

When I click "Show" on the "Equipment" tab
  And I fill out the "Equipment" table with: 
          |Object Code Name   | Description  | Quantity | Total Base Cost |
	  |Medical Equipment* | hospital bed |  1       | 17425           |
  And I click the "Add" button
Then I should see the "Equipment" table with:
          |Object Code Name        | Description  | Quantity | Total Base Cost |
	  |Medical Equipment* 7660 | hospital bed |  1       | 17,425.00       |
  And I click "Show" on "Line Item Details"
  And I should see "State Date" set to "02/01/2015"
  And I should see "End Date" set to "01/31/2016"
  And I should see "Apply Inflation?" set to "No"
  And I should see "Budget Category" set to "Equipment"
  And I click "Hide" on the "Equipment" tab
  
When I click the "Save" button
Then I should see the message "Document was successfully saved."

When I am on the "Parameters" document tab
Then I should see Budget Totals calculated as:
          | Period Start Date  | 02/01/2015 |
          | Period End Date    | 01/31/2016 |
          | Total Sponsor Cost |  25,000.00 |
          | Direct Cost        |  22,425.00 |
          | F&A Cost           |   2,575.00 |
          | Unrecovered F&A    |       0.00 |
          | Cost Sharing       |       0.00 |
  And I check the "Final?" checkbox
  And I set "Budget Status" to "Complete"
  And I click the "Save" button
  And I should see the message "Document was successfully saved."

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
  And I check the "Generate a new Institutional Proposal" radio button
  And I click the "Continue" button
Then I should see "Status" set to "Approved and Submitted" in the document header
  And I should see a message starting with "Institutional Proposal" and ending with "has been generated"