@KFSI-5772 @Draft
Feature: KFSI-5772

  Description:
    Creates a new vendor using a SSN
    * Will fail on step: Then I should see the message "Document was successfully submitted."
      unless a valid SSN is used for the Tax Number.

    *** Will run to completion on KFS DEV environment but not on KFS CDF.

  Background:
    Given I am up top

  Scenario: Can save a note to an ENROUTE Vendor

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec32"
  When I click the "Vendor" link
    And I click the "create new" button
    And I am in the "Document Overview" tab
    And I set the "Description" to "testing: KFSI-5772"


  When I am in the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | KFSI-5772                           |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Disbursement Voucher                |
      | Tax Number                  | 999{6i}                             |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | INDIVIDUAL/SOLE PROPRIETOR          |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
    And I record the "Vendor Name" vendor field in the "General Information" subsection


  When I am in the "Address" tab
    And I fill out the new Vendor "New Address" subsection with:
      | Address Type           | REMIT         |
      | Address 1              | 123 Main St.  |
      | City                   | Tucson        |
      | State                  | AZ            |
      | Postal Code            | 85719         |
      | Country                | UNITED STATES |
      | Set as Default Address | Yes           |
    And I click the "Add" button in the "New Address" subsection
    And I am in the "Address(REMIT-TUSCON)" subsection on the Vendor page
    And I am in the "New Default Address" sub-subsection on the Vendor page
    And I set "Set as campus default for" to "MC - Main Campus" on the Vendor page
    And I click the "Add" button on the Vendor page


  When I am in the "Supplier Diversity" tab
    And I fill out the new Vendor "New Supplier Diversity" subsection with:
      | Supplier Diversity          | AZ SMALL BUSINESS                   |
    And I click the "Add" button in the "New Supplier Diversity" subsection
    And I click the "submit" button
    And I click the "yes" button
  Then I should see the message "Document was successfully submitted."
    And I record this "document" number in the document header


  Given I am logged in as "kfs-test-sec36"
  When I open my Action List, refreshing until that document appears
    And I open the saved document with "Id" of "the recorded document number" on the search page
    And I am in the "Notes and Attachments" tab
    And I set "Note Text" to "This is a note."
    And I click the "Add" button
    And I click "Show" on the "Ad Hoc Recipients" tab
    And I set "Action Requested" to "APPROVE" in the "Person Request" subsection
    And I set "Person" to "kfs-test-sec1" in the "Person Request" subsection
    And I click the "Add" button in the "Person Request" subsection
    And I click the "send ad hoc request" button
    And I sleep for "2" seconds
    And I click the "reload" button
  # Then I should see the message "AdHoc Requests have been sent."
  Then I should see the message "Document was successfully reloaded."
    # And I should see "This is a note."

