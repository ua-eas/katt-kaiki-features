@PVEN002
  Feature: PVEN002 Foreign PO Vendor
    
  Description:
  	Foreign PO Vendor

  Background:
  	Given I am up top

  @Day1 @PVEN002-01
  Scenario: Foreign PO Vendor

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec8"
  When I click the "Vendor" link
    And I set "Vendor Name" to "MICRON*" on the search page
    And I click the "Search" button
    And I click the "Create new" button
  
  When I click the "Collapse All" button
    And I record this "Created" date in the document header
    And I record this "document" number in the document header
    And I click "Show" on the "Document Overview" tab
    And I set "Description" to "PVEN-002 Foreign Vendor"
    And I set "Explanation" to "Payment to foreign vendor"
    And I click "Hide" on the "Document Overview" tab  
  
  When I click "Show" on the "Vendor" tab
  Then I should see "Vendor #" text set to null in the "General Information" subsection
    And I should see "Vendor Parent Indicator" text set to "Yes" in the "General Information" subsection
    And I fill out the new Vendor "General Information" subsection with:
      | Vendor Name                 | Foreign International Company       |
    And I fill out the new Vendor "Corporate Information" subsection with:
      | Vendor Type                 | Purchase Order                      |
      | Is this a foreign vendor    | Yes                                 |
      | Tax Number Type             | *NONE                               |
      | Ownership Type              | FOREIGN VENDOR/INDIVIDUAL           |
      | Ownership Type Category     | FOREIGN COMPANY                     |
    And I fill out the new Vendor "Detail Information" subsection with:
      | Payment Terms               | Net 1 Day - Immediate Pay           |
      | Shipping Title              | CUSTOMS-INTERNATIONAL PORT          |
      | Shipping Payment Terms      | PREPAID                             |
      | Vendor URL                  | www.fakeforeign.international.com   |
      | Confirmation                | No                                  |
      | Restricted                  | No                                  |
      | Conflict of Interest        | None                                |
      | Default Payment Method      | A - ACH/Check                       |
  Then I should see the "Active Indicator" checkbox is "checked" in the "Detail Information" subsection
  When I click "Hide" on the "Vendor" tab
  
  When I click "Show" on the "Supplier Diversity" tab
    And I fill out the new Vendor "New Supplier Diversity" subsection with:
      | Supplier Diversity          | FOREIGN BUSINESS                    |
  Then I should see the "Active Indicator" checkbox is "checked" in the "New Supplier Diversity" subsection
  When I click the "Add" button in the "New Supplier Diversity" subsection
    And I click "Hide" on the "Supplier Diversity" tab
   
  When I click "Show" on the "Address" tab
    And I fill out the new Vendor "New Address" subsection with:
      | Address Type                | PURCHASE ORDER                      |
      | Address 1                   | PO BOX 10                           |
      | Address 2                   | RTE 7                               |
      | City                        | BUCHAREST                           |
      | Postal Code                 | 15Y89K                              |
      | Country                     | ROMANIA                             |
      | URL                         | www.fakeforeign.international.com   |
      | Email Address               | fakeforeignco@yahoo.com             |
      | Set as Default Address      | Yes                                 |
  Then I should see the "Active Indicator" checkbox is "checked" in the "New Address" subsection
  When I click the "Add" button in the "New Address" subsection
    And I click "Hide" on the "Address" tab
    
  When I click "Show" on the "Contact" tab
    And I fill out the new Vendor "New Contact" subsection with:
      | Contact Type                | CUSTOMER SERVICE                    |
      | Name                        | RADU DOGARU                         |
      | Email Address               | fakeforeignco@yahoo.com             |
      | Address 1                   | Ion Slatinenu 19                    |
      | City                        | Bucharest                           |
      | Postal Code                 | 10601                               |
      | Country                     | ROMANIA                             |
      | Attention                   | RADU DOGARU                         |
      | Comments                    | TEST                                |
  Then I should see the "Active Indicator" checkbox is "checked" in the "New Contact" subsection
  When I click the "Add" button in the "New Contact" subsection
    And I click "Hide" on the "Contact" tab
    
  When I click "Show" on the "Shipping Special Conditions" tab
    And I fill out the new Vendor "New Shipping Special Condition" subsection with:
      | Shipping Special Condition  | INSURED                             |
  Then I should see the "Active Indicator" checkbox is "checked" in the "New Shipping Special Condition" subsection
  When I click the "Add" button in the "New Shipping Special Condition" subsection
    And I click "Hide" on the "Shipping Special Conditions" tab
  
  When I click "Show" on the "Vendor Phone Number" tab
    And I fill out the new Vendor "New Phone Numbers" subsection with:
      | Phone Type                  | PHONE NUMBER                        |
      | Phone Number                | 1-51-565-4565                       |
  Then I should see the "Active Indicator" checkbox is "checked" in the "New Phone Numbers" subsection  
  When I click the "Add" button in the "New Phone Numbers" subsection  
    And I click "Hide" on the "Vendor Phone Number" tab
    
  When I click "Show" on the "Notes and Attachments" tab
  Then I should see the "Notes and Attachments" table text filled with:
    | # | Posted Timestamp             |
    | 1 | <document created timestamp> |
  When I set "Note Text" to "TEST"
    And I click the "Add" button
    And I click "Hide" on the "Notes and Attachments" tab
  
  When I click the "Submit" button
    And I click the "Yes" button
  Then I should see the message "Document was successfully submitted."
   
  When I click "Show" on the "Route Log" tab
    And I click "Show" on the "Future Action Requests" tab
    And I click the "Close" button
    And I click the "yes" button
  
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
  When I click the "FYI" button
