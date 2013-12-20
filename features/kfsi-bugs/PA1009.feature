@PA1009
  Feature: Vendor Maintenance

  Background:
    Given I am up top

  @PA1009-01-04
  Scenario: PA1009-01-04

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec32"
  When I click the "Vendor" link
    And I click the "Create new" button
  When I click the "Collapse All" button

    And I click "Show" on the "Document Overview" tab
    And I set "Description" to "testing: PA-1009"
  When I click "Show" on the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | PA-1009 #{4i}                       |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Purchase Order                      |
      | Is this a foreign vendor    | Yes                                 |
      | Tax Number                  | 991111199                           |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | FOREIGN VENDOR/INDIVIDUAL           |
      | Ownership Type Category     | FOREIGN COMPANY                     |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
  When I click "Show" on the "Address" tab
    And I fill out the new Vendor "New Address" subsection with:
      | Address Type                | PURCHASE ORDER                      |
      | Address 1                   | 123 Main St.                        |
      | City                        | Berlin                              |
      | Postal Code                 | 12345-6789                          |
      | Country                     | GERMANY                             |
      | Set as Default Address      | Yes                                 |
    And I click the "Add" button in the "New Address" subsection

    # And I set the first Vendor Address as the campus default for "MC - Main Campus"
    # And I add that Default Address and wait

  When I click "Show" on the "Supplier Diversity" tab
    And I fill out the new Vendor "New Supplier Diversity" subsection with:
      | Supplier Diversity          | AZ SMALL BUSINESS                   |
    And I click the "Add" button in the "New Supplier Diversity" subsection
  When I click "Show" on the "Additional Attributes" tab
    And I fill out the new Vendor "Vendor Sales Tax" subsection with:
      | Arizona Sales Tax License Number | 123456789AB                    |
    And I click the "Submit" button
    And I click the "Yes" button
  Then I should see the message "Document was successfully submitted."
    And I should see "ID:" in the "routeLog" iframe
    And I should see "Actions Taken" in the "routeLog" iframe
    And I record this "Document" number in the document header

    And I am logged in as "kfs-test-sec50"
    And I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  @PA-1009-01-04
  Scenario: PA-1009-01-04-CreateForeignVendor, more exciting fields

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec32"
    And I click the "Vendor" link
    And I click the "Create new" button
  When I click the "Collapse All" button
    And I click "Show" on the "Document Overview" tab
    And I set the "Description" to "testing: PA-1009"

  When I click "Show" on the "Vendor" tab
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | PA-1009 1111                      |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Purchase Order                      |
      | Is this a foreign vendor    | Yes                                 |
      | Tax Number                  | 991111199                           |
      | Tax Number Type             | *SSN                                |
      | Ownership Type              | FOREIGN VENDOR/INDIVIDUAL           |
      | Ownership Type Category     | FOREIGN COMPANY                     |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
  When I click "Show" on the "Address" tab
    And I fill out the new Vendor "New Address" subsection with:
      | Address Type                | PURCHASE ORDER                      |
      | Address 1                   | 123 Main St.                        |
      | City                        | Berlin                              |
      | Postal Code                 | 12345-6789                          |
      | Country                     | GERMANY                             |
      | Set as Default Address      | Yes                                 |
    And I click the "Add" button in the "New Address" subsection

    # And I set the first Vendor Address as the campus default for "MC - Main Campus"
    # And I add that Default Address and wait

    And I click "Show" on the "Contact" tab
    And I fill out the new Vendor "New Contact" subsection with:
      | Attention | Not Sammy |
      | Comments  | Overridden |
    And I click the "Add" button in the "New Contact" subsection

 When I click "Show" on the "Supplier Diversity" tab
   And I fill out the new Vendor "New Supplier Diversity" subsection with:
     | Supplier Diversity          | AZ SMALL BUSINESS                   |
   And I click the "Add" button in the "New Supplier Diversity" subsection

  When I click "Show" on the "Shipping Special Conditions" tab
    And I fill out the new Vendor "New Shipping Special Condition" subsection with:
      | Shipping Special Condition  | LIVE ANIMAL                        |
    And I click the "Add" button in the "New Shipping Special Condition" subsection
 When I click "Show" on the "Additional Attributes" tab
   And I fill out the new Vendor "Vendor Sales Tax" subsection with:
     | Arizona Sales Tax License Number | 123456789AB                    |
   And I click the "Submit" button
   And I click the "Yes" button
  Then I should see the message "Document was successfully submitted."
    And I should see "ID:" in the "routeLog" iframe
    And I should see "Actions Taken" in the "routeLog" iframe
    And I record this "Document" number in the document header

   And I am logged in as "kfs-test-sec50"
   And I click the "document search" button
   And I set "Document/Notification Id" to "the recorded document number" on the search page
   And I click the "search" button
   And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
 Then a new browser window appears
   And I click the "approve" button