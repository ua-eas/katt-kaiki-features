@KFSI-1063
Feature: KFSI-1063

  Description:
   01 - Create New Vendor
   02 - Vendor Approval

  Background:
    Given I am up top

  @Day1 @KFSI-1063-01
  Scenario: I can hide inactive Vendor Aliases.

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec32"
  When I click the "Vendor" link
    And I click the "Create new" button
    And I record this "document" number in the document header
  When I am in the "Document Overview" tab
    And I set "Description" to "testing: KFSI-1063"
    And I set "Explanation" to "testing: KFSI-1063"
    And I click "Hide" on the "Document Overview" tab


  When I am in the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | KFSI-1063                           |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Purchase Order                      |
      | Tax Number                  | 999234597                          |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | INDIVIDUAL/SOLE PROPRIETOR          |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
    And I record the "Vendor Name" vendor field in the "General Information" subsection


  When I am in the "Address" tab
    And I fill out the new Vendor "New Address" subsection with:
      | Address Type                | PURCHASE ORDER                      |
      | Address 1                   | MC - Main Campus                    |
      | City                        | Tucson                              |
      | State                       | AZ                                  |
      | Postal Code                 | 85737                               |
      | Country                     | UNITED STATES                       |
      | Set as Default Address      | Yes                                 |
  When I click the "Add" button in the "New Address" subsection


  When I am in the "Supplier Diversity" tab
    And I fill out the new Vendor "New Supplier Diversity" subsection with:
      | Supplier Diversity          |AZ SMALL BUSINESS                    |
  When I click the "Add" button in the "New Supplier Diversity" subsection


  When I click "Show" on the "Search Alias" tab
    And I fill out the new Vendor "New Search Alias" subsection with:
      | Search Alias Name           | KFSI-1063 Alias                     |
    And I uncheck the "Active Indicator" checkbox in the "Search Alias" subsection
  When I click the "Add" button in the "New Search Alias" subsection
  When I click the "Submit" button
    And I click the "Yes" button
  Then I should see the message "Document was successfully submitted."

  @Day1 @KFSI-1063-02
  Scenario: Vendor Approval

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
   And I am logged in as "kfs-test-sec32"
  When I click the "Vendor" link
   And I set "Vendor Name" to "the recorded vendor name" on the search page
   And I click the "search" button
   And I open the saved document with "Vendor Name" of "the recorded vendor name" on the search page
  When I "edit" the first record on the search page
  When I click "Show" on the "Search Alias" tab
  When I click "Hide" on the "Search Alias(KFSI-1063 Alias)" tab
  Then I do not see "HTTP Status 500"
   And I do not see "Incident Report form"

