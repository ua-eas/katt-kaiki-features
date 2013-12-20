@KFSI-4479
Feature: KFSI-4479

  Description:
    Creates a new vendor using a SSN
    * Will fail on step: Then I should see the message "Document was successfully submitted."
      unless a valid SSN is used for the Tax Number.

  Background:
    Given I am up top

  Scenario: AZ Tax # can be entered correctly

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec32"
  When I click the "Vendor" link
    And I click the "create new" button
    And I am in the "Document Overview" tab
    And I set the "Description" to "testing: KFSI-4479"


  When I am in the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | KFSI-4479                           |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Purchase Order                      |
      | Tax Number                  | 999{6i}                             |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | INDIVIDUAL/SOLE PROPRIETOR          |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |


  When I am in the "Address" tab
    And I fill out a new Vendor Address with default values
    And I click the "Add" button in the "New Address" subsection
    And I am in the "Address(PURCHASE ORDER-TUSCON)" subsection on the Vendor page
    And I am in the "New Default Address" sub-subsection on the Vendor page
    And I set "Set as campus default for" to "MC - Main Campus" on the Vendor page
    And I click the "Add" button on the Vendor page


  When I am in the "Supplier Diversity" tab
    And I fill out the new Vendor "New Supplier Diversity" subsection with:
      | Supplier Diversity          | AZ SMALL BUSINESS                   |
    And I click the "Add" button in the "New Supplier Diversity" subsection


  When I am in the "Additional Attributes" tab
    And I fill out the new Vendor "Vendor Sales Tax" subsection with:
      | Arizona Sales Tax License Number | 123456789AB                    |
    And I click the "submit" button
    And I click the "yes" button
  Then I should see the message "Document was successfully submitted."


  # When I am in the "Additional Attributes" tab
    # And I should see "Arizona Sales Tax License Number" text set to "123456789AB" in the "Vendor Sales Tax" subsection
    And I record this "document" number in the document header


  Given I am logged in as "kfs-test-sec50"
    And I open my Action List, refreshing until that document appears
    And I open the saved document with "Id" of "the recorded document number" on the search page
    And I click "disapprove" with reason "Don't leave a doc hanging."
