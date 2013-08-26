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

Scenario: Create and finalize new award

				
Given I am backdoored as "sandovar"
  And I am on the "Central Admin" tab
  When I click the "Awards" portal link
Then I should see "Document ID:Status" set to something like ":INITIATED" in the document header
When I set the "Description" to "Garland, NIA, 3001500"
  And I show the "Funding Proposals" tab
  And I start a lookup for "Institutional Proposal ID"
  And I set "Proposal Type" to "New"
  And I set "Status" to "Pending"
  And I set "Project Title" to "Test scenario: create and submit basic proposal"
  And I click the "Search" button
Then I should see one or more items retrieved
When I return the first record
  And I click "Add" button
Then I should see "PI" set to "Linda L Garland" in the document header
  And I should see "Lead Unit" set to "Cancer Center Division" in the document header
  And I should see "Sponsor Name" set to "National Institute on Aging" in the document header
  And I should see "1" under the Award Version header
  And I should see "Linda L Garland" under the Principal Investigator header
  And I should see "0721 - Cancer Center Division" under the Lead Unit header
  And I should see "010803 National Institute on Aging" under the Proposed Sponsor header
  And I should see "02/01/2014" under the Proposed Start Date header
  And I should see "01/31/2019" under the Proposed End Date header
  And I should see "$500,000.00" under the Total Costs
  And I should see "Test scenario: create and submit basic proposal" in the Award Title
  And I should see "010803" in Sponsor ID
  And I should see "National Institute on Aging" under the Sponsor ID
  And I should see "0721" in Lead Unit ID
  And I should see "Research" in Activity Type
  And I should see "F.03 Medical - Life Sciences" in NSF Science Code
When I set "Transaction Type" to "New"
  And I set the "Notice Date" to "01/01/2014"
  And I set the "Comments" to "New award: Ant/Obl $500,000.00 02/01/2014-01/31/2019"
  And I set the "Award Status" to "Active"
  And I set the "Account ID" to "3001500"
  And I set the "Award Type" to "Grant"
  And I set the "Sponsor Award ID" to "1R01AG012345-01"
  And I set the "Modification ID" to "01"
  And I set the "CFDA Number" to "93.866"
  And I set the "NSF Science Code" to "F.02: Biological - Life Sciences"
  And I set the "Project Start Date" to "02/01/2014"
  And I set the "Project End Date" to "01/31/2019"
  And I set the "Execution Date" to "12/15/2013"
  And I click "Show" on the "Sponsor Template" tab
  And I start a lookup for "Sponsor Template Code"
  And I click "search"
  And I return the record with "Sponsor Template Code" of "1"
Then I should see "To Be Determined" next to "Description"
When I click "Apply" button
  And I click "Yes" to "Are you sure you want to apply this Sponsor Template?"
  And I click "No" to "Cost Share information is already defined in this award.  Do you want to replace current Cost Share information with selected To Be Determined template information?"
  And I click "Save" button
Then I should see the message "Document was successfully saved."
  And I should see "Document ID:Status" set to something like ":SAVED" in the document header
  And I should see "Award ID: Account:" set to something like "-00001:3001500" in the document header
  And I should see "Last Update" set to something like " by sandovar" in the document header
When I select "Time & Money" 
Then I should see "01/31/2019" under Project End

When I set the "Oblg. Start" to "02/01/2014"
  And I set the "Oblg. End" to "01/31/2015"
  And I set "Transaction Type Code" to "New"
  And I set "Notice Date" to "01/01/2014"
  And I click the "save" button
Then I should see the message "Document was successfully saved."

When I click "Show" on the "Direct/F&A Funds Distribution" tab
  And I fill out the "Budget Periods" table with:
    | #      | Direct Cost | F&A Cost | 
    |  1     | 66000       | 34000    | 
    |  2     | 66000       | 34000    | 
    |  3     | 66000       | 34000    | 
    |  4     | 66000       | 34000    | 
    |  5     | 66000       | 34000    | 
  And I click "Recalculate"
Then I should see the "Budget Periods" table filled out with:
    |  #     | Direct Cost | F&A Cost  | 
    |  1     | 66,000.00   | 34,000.00 |
    |  2     | 66,000.00   | 34,000.00 |
    |  3     | 66,000.00   | 34,000.00 |
    |  4     | 66,000.00   | 34,000.00 |
    |  5     | 66,000.00   | 34,000.00 |
  And I should see "Total" calculated as:
      |Direct Cost 			| $330,000.00 |
      |F&A Cost   			| $170,000.00 |
  And I should see "Total Anticipated(Direct + F&A):" set to "$500,000.00"

When I click the "Save" button
Then I should see the message "Document was successfully saved."
  And I should see the message "Warning exists in Direct/F&A Funds Distribution section."

When I set "Obligated" to "100000"
  And I set "Anticipated" to "500000"
  And I click the "Save" button
Then I should see the message "Document was successfully saved."

When I select "Submit"
  And I wait for the document to finish being processed
Then I should see "Document ID:Status" set to something like ":Final" in the document header

When I click "Return to Award"
  And I select "Contacts" tab at the top of the document
  And I show the "Key Personnel and Credit Split" tab
Then I should see the "Key Personnel" table filled out with the following values:
  | line  | Person          | Unit                   | Project Role    | Office Phone | Email                     |
  | 1     | Linda L Garland | Cancer Center Division | PI/Contact      | 520-626-3434 | lgarland@azcc.arizona.edu |
  | 2     | Amanda F Baker  | Cancer Center Division | Co-Investigator | 520-626-0301 | abaker@azcc.arizona.edu   |

When I show the "Person Details" for "Linda L Garland"
Then I should see "Total Effort" as "5.00"

When I hide "Person Details" for "Linda L Garland"
  And I show the "Person Details" for "Amanda F Baker"
Then I should see "Total Effort" as "20.00"

When I hide "Person Details" for "Amanda F Baker"
  And I show "Unit Details" for "Linda L Garland"
Then I should see "Unit Name" as "Cancer Center Division"
  And I should see "Unit Number" as "0721"

When I hide "Unit Details" for "Linda L Garland"
  And I show "Unit Details" for "Amanda F Baker"
Then I should see "Unit Name" as "Cancer Center Division"
  And I should see "Unit Number" as "0721"

When I hide "Unit Details" for "Amanda F Baker"
  And I fill out the Combined Credit Split for "Linda L Garland" with the following:
        | Credit for Award | 20 |
        | F&A Revenue      | 20 |
  And I fill out the Combined Credit Split for "Amanda F Baker" with the following:
        | Credit for Award | 80 |
        | F&A Revenue      | 80 |
  And I click "Recalculate"
Then I should see Combined Credit Split for "Linda L Garland" with the following:
        | Credit for Award | 20.00 |
        | F&A Revenue      | 20.00 |
  And I should see Combined Credit Split for "Amanda F Baker" with the following:
        | Credit for Award | 80.00 |
        | F&A Revenue      | 80.00 |

When I show the "Sponsor Contacts" tab
Then I should see "Person or Organization" as "Last Name TBD, First Name TBD Middle Name TBD"
  And I should see "Project Role" as "Other"

When I click the "Save" button
  Then I should see the message "Document was successfully saved."

When I am on the "Commitments" document tab
  And I click "Show" on the "Rates" tab
  And I set the "Rate" to "51.50"
  And I set the "Type" to "MTDC"
  And I set the "Fiscal Year" to "2014"
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

When I click "Add" button
  And I click the "Save" button
Then I should see the message "Document was successfully saved."

When I am on the "Special Review" document tab
Then I should see the "Special Review" table filled out with the folowing values:
  | line | Type           | Approval Status |
  | 1    | Human Subjects | Approved        |

When I fill out the "Special Review" table with:          
  | line | Approval Date |
  |  1   | 01/15/2014    |
  And I click the "Save" button
Then I should see the message "Document was successfully saved."

When I am on the "Custom Data" document tab
  And I click "Show" on the "Project Information" tab
Then I should see "Project Location (Bldg#-Rm#-Other):" as "0211-0124-"
  And I should see "F&A Rate % (ex: 51.000/51.500):" as "51.500"

When I click the "Save" button
  And I select the "Award Actions" tab at the top of the document
  And I click "Show" on the "Data validation" tab
  And I show the "Data validation" tab
  And I click the "turn on validation" button
Then I should see "No Validation Errors present."
  And I should see "No Warnings present."
When I click the "Submit" button
  And I wait for the document to finish being processed
Then I should see "Document ID:Status" set to something like ":Final" in the document header
  And I should see the message "Document was successfully submitted."
