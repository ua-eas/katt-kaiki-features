@KFSI-5783
Feature: KFSI-5783

  Description:
    01 - Create Requisition
    02 - Requisition Approval

  Background:
    Given I am up top

  @Day1 @KFSI-5783-01
  Scenario: Create Requisition

    Given I am on the "Main Menu" system tab
      And I am logged in as "kfs-test-sec21"
    When I click the "Requisition" link
      And I click the "Collapse All" button

    When I click "Show" on the "Document Overview" tab
      And I am in the "Document Overview" section
      And I set "Description" to "testing: KFSI-5783"
      And I am in the "Requisition Detail" section
      And I check the "Receiving Required" checkbox

    When I click "Show" on the "Delivery" tab
      And I am in the "Final Delivery" section
      And I start a lookup for "Building"
      And I set "Building Code" to "10" on the search page
      And I click the "Search" button
    When I select the first document on the search page
      And I start a lookup for "Room"
      And I set "Building Room Number" to "0001" on the search page
      And I click the "Search" button
    When I select the first document on the search page


    When I click "Show" on the "Vendor" tab
      And I am in the "Vendor Address" section
      And I start a lookup for "Suggested Vendor"
      And I set "Vendor Name" to "Micron" on the search page
      And I click the "Search" button
    When I select the first document on the search page

    Then I click "Show" on the "Items" tab
    When I am in the "Add Item" section
      And I add to the "Add Item" table with:
      | Item Type        | Quantity | Unit Of Measure Code | Catalog # | Description       | Unit Cost | Action |
      | QUANTITY TAXABLE | 10       | EA                   | 123-ABC   | a 5783 widget     | 100.00    | Add    |
      | QUANTITY TAXABLE | 10       | EA                   | 123-ABC   | a 5783 widget     | 100.00    | Add    |
      | QUANTITY TAXABLE | 10       | EA                   | 123-ABC   | a 5783 widget     | 100.00    | Add    |
      And I am in the "Current Items" section
      And I fill out the "Accounting Lines" table with:
      | Item # | Chart | Account Number | Object | Percent | Action |
      | Item 1 | UA    |  1080000         | 5230   | 100   | Add    |
      | Item 2 | UA    |  1080000         | 5230   | 100   | Add    |
      | Item 3 | UA    |  1080000         | 5230   | 100   | Add    |
      And I click "Hide" on the "Items" tab


    When I click "Show" on the "Additional Institutional Info" tab
      And I am in the "Additional" section
    When I set "Requestor Email" to "kfsi-5783@email.arizona.edu"
      And I click "Hide" on the "Additional Institutional Info" tab

      And I click the "Calculate" button
      And I click the "Submit" button
      And I record this "Document" number in the document header
      And I record this "requisition" number in the document header
      And I should see the message "Document was successfully submitted."


    @Day1 @KFSI-5783-02
    Scenario: Requisition Approval

    Given I am on the "Main Menu" system tab
    Given I am logged in as "kfs-test-sys10"
    When I click the "document search" button
      And I set "Document/Notification Id" to "the recorded document number" on the search page
      And I click the "search" button
      And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
    Then a new browser window appears
      And I click the "approve" button

    When I click the "document search" button
      And I set "Document/Notification Id" to "the recorded document number" on the search page
      And I click the "search" button
      And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
    Then a new browser window appears
      And I should see "Status" text set to "FINAL" in the document header
      And I should see "Requisition Status" text set to "Awaiting Contract Manager Assignment" in the document header
    When I close all extra browser windows

    Given I am on the "Main Menu" system tab
      And I am logged in as "kfs-test-sec40"
    When I click the "Contract Manager Assignment" link
      And I am in the "Document Overview" tab
      And I should see "Description" set to "Contract Manager Assigned"

    When I am in the "Assign A Contract Manager" tab
      And I should see a table row with a Requisition Number of "the recorded requisition number"
    When I start a lookup for "Contract Manager"
      And I set "Contract Manager Code" to "13" on the search page
      And I click the "Search" button
      And I return the record with "Contract Manager Code" of "13" on the search page
    Then I click the "Submit" button

