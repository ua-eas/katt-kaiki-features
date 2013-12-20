@KFSI-5958
Feature: KFSI-5958

  Description:
    01 - Create Requisition
    02 - Requisition Approval
    03 - Assigns Contract Manager
    04 - Create PO
    05 - Approve PO
    06 - Create Payment Request
    07 - Receiving

  Background:
    Given I am up top

  @Day1 @KFSI-5958-01
  Scenario: When a credit memo is processed

    Given I am on the "Main Menu" system tab
      And I am logged in as "kfs-test-sec21"
    When I click the "Requisition" link
      And I click the "Collapse All" button

    When I click "Show" on the "Document Overview" tab
      And I am in the "Document Overview" section
      And I set "Description" to "testing: KFSI-5958"
      And I am in the "Requisition Detail" section
      And I check the "Receiving Required" checkbox

    When I click "Show" on the "Delivery" tab
      And I am in the "Final Delivery" section
      And I start a lookup for "Building"
      And I click the "Search" button
    When I select the first document on the search page
      And I start a lookup for "Room"
      And I set "Building Room Number" to "0001" on the search page
      And I click the "Search" button
    When I select the first document on the search page

    When I click "Show" on the "Vendor" tab
      And I am in the "Vendor Address" section
      And I start a lookup for "Suggested Vendor"
      And I click the "Search" button
      When I select the first document on the search page

    Then I click "Show" on the "Items" tab
    When I am in the "Add Item" section
      And I add to the "Add Item" table with:
      | Item Type        | Quantity | Unit Of Measure Code | Catalog # | Description       | Unit Cost | Action |
      | QUANTITY TAXABLE | 10       | EA                   | 123-ABC   | a 5958 widget     | 5.00      | Add    |
      | QUANTITY TAXABLE | 10       | EA                   | 123-ABC   | a 5958 widget     | 5.00      | Add    |
      And I am in the "Current Items" section
      And I fill out the "Accounting Lines" table with:
      | Item # | Chart | Account Number | Object | Percent | Action |
      | Item 1 | UA    | 1639100        | 5320   | 100     | Add    |
      | Item 2 | UA    | 1639100        | 5320   | 100     | Add    |

    When I click "Show" on the "Additional Institutional Info" tab
      And I am in the "Additional" section
    When I set "Requestor Email" to "kfsi-5958@email.arizona.edu"
      And I click "Hide" on the "Additional Institutional Info" tab

      And I click the "Calculate" button
      And I click the "Submit" button
      And I record this "Document" number in the document header
      And I record this "requisition" number in the document header
      And I should see the message "Document was successfully submitted."

    @Day1 @KFSI-5958-02
    Scenario: Requisition Approval

    Given I am on the "Main Menu" system tab
    Given I am logged in as "kfs-test-sys10"
    When I click the "document search" button
      And I set "Document/Notification Id" to "the recorded document number" on the search page
      And I click the "Search" button
      And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
    Then a new browser window appears
      And I click the "approve" button

    @Day1 @KFSI-5958-03
    Scenario: Contract Manager Assignment

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

    @Day1 @KFSI-5958-04
    Scenario: Create PO

    Given I am on the "Main Menu" system tab
      And I am backdoored as "kfs-test-sec40"
    When I click the "Purchase Orders" link
      And I set "Type" to "PO" on the search page
      And I set "Contract Manager" to "13" on the search page
      And I set "Requisition #" to "the recorded requisition number" on the search page
      And I click the "Search" button
      And I select the first document on the search page
    Then a new browser window appears
      And I click the "Collapse All" button

    When I click "Show" on the "Delivery" tab
      And I am in the "Receiving Address" section
      And I start a lookup for "Receiving Address"
      And I click the "clear" button
      And I click the "search" button
      And I return the record with "Receiving Name" of "Main Campus" on the search page
      And I am in the "Address To Vendor" section
      And I should see "Shipping Address Presented to Vendor (use Receiving Address?)" radio button set to "Final Delivery Address"
      And I click "Hide" on the "Delivery" tab

    When I click "Show" on the "Vendor" tab
      And I am in the "Vendor Info" section
      And I set "Vendor Choice" to "Other"
      And I click "Hide" on the "Vendor" tab

    When I click "Show" on the "Stipulations" tab
      And I am in the "Vendor Stipulations and Information" section
      And I start a lookup for "Note Text"
      And I set "Vendor Stipulation Name" to "085" on the search page
      And I click the "Search" button
      And I return the record with "Vendor Stipulation Name" of "085" on the search page
      And I click the "Add" button
      And I set "Note Text" to "Rush Order"
      And I click the "Add" button
      And I click "Hide" on the "Stipulations" tab

    When I click "Show" on the "Notes and Attachments" tab
      And I set "Note Text" to "KFSI5958"
      And I click the "Add" on "Notes and Attachments"
      And I click "Hide" on the "Notes and Attachments" tab

    When I click "Show" on the "Ad Hoc Recipients" tab
      And I set "Action Requested" to "FYI" in the "Person Requests" subsection
      And I set "Principal Name" to "kfs-test-sec9"
      And I click the "Add" button in the "Person Requests" subsection
      And I click "Hide" on the "Ad Hoc Recipients" tab

    When I click the "calculate" button
      And I click the "Submit" button
      And I should see the message "Document was successfully submitted."
      And I record this "Purchase Order Document" number in the document header
    Then I click the "Close" button

    @Day1 @KFSI-5958-05
    Scenario: PO Approve

    Given I am on the "Main Menu" system tab
    Given I am logged in as "kfs-test-sec9"
    When I click the "document search" button
      And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
      And I click the "search" button
      And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page
    Then a new browser window appears
      And I click the "print" button
    When I close all extra browser windows

    Given I am logged in as "kfs-test-sec40"
    When I click the "document search" button
      And I set "Document/Notification Id" to "the recorded purchase order document number" on the search page
      And I click the "search" button
      And I open the saved document with "Document/Notification Id" of "the recorded purchase order document number" on the search page
    Then a new browser window appears
      And I record this "Purchase Order" number in the document header
      And I should see "Status" text set to "FINAL" in the document header
    When I close all extra browser windows

    @Day1 @KFSI-5958-06
    Scenario: Payment Request

    Given I am on the "Central Admin" system tab
      And I am logged in as "kfs-test-sec36"
      And I click the "Payment Request" link
      And I am in the "Payment Request Initiation" tab
      And I set "Purchase Order #" to "the recorded purchase order number"
      And I set "Invoice Number" to "PREQ<todays date>"
      And I set "Invoice Date" to "Today's Date"
      And I set "Vendor Invoice Amount" to "1000"
      And I click the "continue" button
      And I click the "Collapse All" button

    When I click "Show" on the "Invoice Info" tab
      And I check the "Immediate Pay" checkbox
      And I click "Hide" on the "Invoice Info" tab

    When I click "Show" on the "Process Items" tab
      And I am in the "Items" section
      And I fill out the "Items" table with:
      | Item # | Quantity Invoiced |
      | 1      | 1                 |
      And I click "Hide" on the "Process Items" tab

    When I click the "calculate" button
      And I click the "save" button
      And I should see the message "Document was successfully saved."

    @Day1 @KFSI-5958-07
    Scenario: Receiving

    Given I am on the "Main Menu" system tab
      And I am logged in as "kfs-test-sec36"
    When I click the "Receiving" link under the "Transactions" heading
    When I am in the "Line Item Receiving Initiation" tab
      And I set the "Purchase Order #" to "the recorded purchase order number"
      And I set "Vendor Date" to "Today's Date"
      And I click the "continue" button
      And I click the "Collapse All" button

    When I click "Show" on the "Items" tab
      And I am in the "Receiving Line Items" section
      And I fill out the "Receiving Line Items" table with:
      | # | Item Received Total Quantity |
      | 1 | 1                            |
      And I click "Hide" on the "Items" tab

      And I click the "submit" button
