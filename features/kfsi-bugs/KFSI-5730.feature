@KFSI5730
  Feature: KFSI-5730

  Description:


  Background:
    Given I am up top

  @Day1 @KFSI5730-01
  Scenario: A PO vendor can be created.

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec8"
  When I click the "Vendor" link
    And I click the "Create new" button

  When I click the "Collapse All" button
    And I record this "Created" date in the document header
    And I record this "document" number in the document header
    And I click "Show" on the "Document Overview" tab
    And I set "Description" to "testing: KFSI-5730"
    And I click "Hide" on the "Document Overview" tab

  When I click "Show" on the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | KFSI-5730 #{4i}      |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Purchase Order                      |
      | Tax Number                  | 99999{4i}                           |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | INDIVIDUAL/SOLE PROPRIETOR          |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
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
      | Supplier Diversity          | AZ SMALL BUSINESS                   |
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



  @KFSI5730-02
  Scenario: A DV vendor can be created.
  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec8"
  When I click the "Vendor" link
    And I click the "Create new" button

  When I click the "Collapse All" button
    And I record this "Created" date in the document header
    And I record this "document" number in the document header
    And I click "Show" on the "Document Overview" tab
    And I set "Description" to "testing: KFSI-5730"
    And I click "Hide" on the "Document Overview" tab


  When I click "Show" on the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | KFSI-5730 #{4i}      |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Disbursement Voucher                |
      | Tax Number                  | 99999{4i}                           |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | INDIVIDUAL/SOLE PROPRIETOR          |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
  When I click "Hide" on the "Vendor" tab

  When I click "Show" on the "Address" tab
    And I fill out the new Vendor "New Address" subsection with:
      | Address Type                | REMIT                               |
      | Address 1                   | 123 Main St.                        |
      | City                        | Tuscon                              |
      | State                       | AZ                                  |
      | Postal Code                 | 85719                               |
      | Country                     | UNITED STATES                       |
      | Set as Default Address      | Yes                                 |
  When I click the "Add" button in the "New Address" subsection
    And I am in the "Address(REMIT-TUSCON)" subsection on the Vendor page
    And I am in the "New Default Address" sub-subsection on the Vendor page
    And I set "Set as campus default for" to "MC - Main Campus" on the Vendor page
    And I click the "Add" button on the Vendor page

  When I click "Show" on the "Supplier Diversity" tab
    And I fill out the new Vendor "New Supplier Diversity" subsection with:
      | Supplier Diversity          | AZ SMALL BUSINESS                   |
  When I click the "Add" button in the "New Supplier Diversity" subsection
    And I click "Hide" on the "Supplier Diversity" tab

  When I click the "Submit" button
    And I click the "Yes" button
  Then I should see the message "Document was successfully submitted."

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"
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
