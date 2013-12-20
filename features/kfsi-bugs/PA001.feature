@PA001
  Feature: Purchasing PA001

  Background:
    Given I am up top

  @PA001-01
  Scenario:

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec1"
  When I click the "Requisition" link
    And I click the "Collapse All" button
  When I click "Show" on the "Document Overview" tab
    And I set the "Description" to "testing: PA-001"
  When I am in the "Requisition Detail" section
    And I check the "Receiving Required" checkbox
  When I click "Show" on the "Delivery" tab
    And I am in the "Final Delivery" section
    And I start a lookup for "Building"
    And I set "Building Code" to "10" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I start a lookup for "Room"
    And I set "Building Room Number" to "0001" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
  When I click "Show" on the "Vendor" tab
    And I am in the "Vendor Address" section
    And I start a lookup for "Suggested Vendor"
    And I set "Vendor Name" to "Micron" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
  When I click "Show" on the "Items" tab
    And I am in the "Add Item" section
    And I add to the "Add Item" table with:
      | Item Type        | Quantity | Unit Of Measure Code | Catalog # | Description         | Unit Cost | Action |
      | QUANTITY TAXABLE | 10       | EA                   |           | a 5783 widget       | 100       | Add    |
      | QUANTITY TAXABLE | 20       | EA                   |           | another 5783 widget | 200       | Add    |
      | QUANTITY TAXABLE | 30       | EA                   |           | a third 5783 widget | 300       | Add    |
    And I am in the "Current Items" section
    And I fill out the "Accounting Lines" table with:
      | Item # | Chart | Account Number | Object | Percent | Action |
      | Item 1 | UA    | 1080000        | 5230   | 100     | Add    |
      | Item 2 | UA    | 1080000        | 5230   | 100     | Add    |
      | Item 3 | UA    | 1080000        | 5230   | 100     | Add    |
  When I click "Show" on the "Additional Institutional Info" tab
    And I am in the "Additional" section
    And I set the "Requestor Email" to "kfsi-5783@email.arizona.edu"
    And I click the "Calculate" button
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I record this "Document" number in the document header
    And I record this "requisition" number in the document header

  When I am logged in as "kfs-test-sys10"
    And I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  When I am logged in as "kfs-test-sec22"
    And I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  When I am logged in as "kfs-test-sec40"
    And I am on the "Main Menu" system tab
    And I click the "Contract Manager Assignment" link
  When I am in the "Assign A Contract Manager" tab
    And I should see a table row with a Requisition Number of "the recorded requisition number"
  When I start a lookup for "Contract Manager"
    And I set "Contract Manager Code" to "13" on the search page
    And I click the "Search" button
    And I return the record with "Contract Manager Code" of "13" on the search page
  Then I click the "Submit" button
    And I should see the message "Document was successfully submitted."