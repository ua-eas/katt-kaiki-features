@KFSI1021
  Feature: KFSI-1021

  Description:
    This feature tests that a new Purchase Order vendor can be created and that
    it can be used in a new requisition.

    01 - Create a new PO Vendor
    02 - Create a Requisition using the new PO Vendor

  Background:
    Given I am up top

  @Day1 @KFSI1021-01
  Scenario: Create a new PO Vendor

  Given I am logged in as "kfs-test-sec32"
    And I am on the "Main Menu" system tab
  When I click the "Vendor" link
    And I click the "Create new" button

  When I click the "Collapse All" button
    And I record this "document" number in the document header
    And I click "Show" on the "Document Overview" tab
    And I set the "Description" to "testing: KFSI-1021"
    And I click "Hide" on the "Document Overview" tab

  When I click "Show" on the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | KFSI-1021 #{4i}                     |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Purchase Order                      |
      | Tax Number                  | 99999{4i}                           |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | INDIVIDUAL/SOLE PROPRIETOR          |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
    And I record the "Vendor Name" vendor field in the "General Information" subsection
  When I click "Hide" on the "Vendor" tab

  When I click "Show" on the "Address" tab
    And I fill out the new Vendor "New Address" subsection with:
      | Address Type                | PURCHASE ORDER                      |
      | Address 1                   | 123 Main St.                        |
      | City                        | Tuscon                              |
      | State                       | AZ                                  |
      | Postal Code                 | 85719                               |
      | Country                     | UNITED STATES                       |
      | Set as Default Address      | Yes                                 |
  When I click the "Add" button in the "New Address" subsection
    And I am in the "Address(PURCHASE ORDER-TUSCON)" subsection on the Vendor page
    And I am in the "New Default Address" sub-subsection on the Vendor page
    And I set "Set as campus default for" to "MC - Main Campus" on the Vendor page
    And I click the "Add" button on the Vendor page
    And I click "Hide" on the "Address" tab

  When I click "Show" on the "Supplier Diversity" tab
    And I fill out the new Vendor "New Supplier Diversity" subsection with:
      | Supplier Diversity          | AZ SMALL BUSINESS                    |
  When I click the "Add" button in the "New Supplier Diversity" subsection
    And I click "Hide" on the "Supplier Diversity" tab
  When I click the "Submit" button
    And I click the "Yes" button
  Then I should see the message "Document was successfully submitted."

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec50"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
  When I click the "approve" button
    And I click the "Yes" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec8"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click "Show" on the "Route Log" tab
    And I should see "Status" set to "FINAL"

  @Day1 @KFSI1021-02
  Scenario: Create a Requisition using the new PO Vendor

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec8"
  When I click the "Requisition" link
    And I click the "Collapse All" button

  When I click "Show" on the "Document Overview" tab
    And I set "Description" to "testing: KFSI-1021"
    And I click "Hide" on the "Document Overview" tab

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
    And I click "Hide" on the "Delivery" tab

  When I click "Show" on the "Vendor" tab
    And I am in the "Vendor Address" section
    And I start a lookup for "Suggested Vendor"
    And I set "Vendor Name" to "the recorded vendor name" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I click "Hide" on the "Vendor" tab

  When I click "Show" on the "Items" tab
    And I am in the "Add Item" section
    And I add to the "Add Item" table with:
      | Item Type        | Quantity | Unit Of Measure Code | Description       | Unit Cost | Action |
      | QUANTITY TAXABLE | 42       | BDL                  | Surprises         | 3.14      | Add    |
    And I click "Hide" on the "Items" tab

  When I click "Show" on the "Additional Institutional Info" tab
    And I am in the "Additional" section
    And I set "Requestor Phone" to "345-876-6589"
    And I set "Requestor Email" to "testID@fakeserver.edu"
    And I click "Hide" on the "Additional Institutional Info" tab

  When I click the "Calculate" button
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
