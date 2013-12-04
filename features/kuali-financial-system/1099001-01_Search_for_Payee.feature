@1099001
  Feature: 1099001-01 Search for Payee

  Description:
  	Search for Payee

  Background:
  	Given I am up top

  Scenario: Search for Payee

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec52"
  When I click the "Payee" link
    And I set "Vendor #" to "11223-0" on the search page
    And I set "Tax Year" to "2013" on the search page
    And I click the "Search" button
    And I should see the message "No values match this search"
  
  When I click the "Create new" button
    And I am in the "Document Overview" tab
    And I set "Description" to "1099-001"
    And I set "Explanation" to "Add 1099 Payee"
  
  When I am in the "Edit Payee" tab
    And I start a lookup for "Vendor #"
    And I set "Vendor #" to "11223-0" on the search page
    And I click the "Search" button
    And I return the record with "Vendor #" of "11223-0" on the search page
    And I set "Tax Number" to "534234567" in the "New" subsection
    And I set "Tax Year" to "2013" in the "New" subsection
    And I record this "document" number in the document header
    And I click the "blanket approve" button
  
  Given I am on the "Main Menu" system tab
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click "Show" on the "Route Log" tab
    And I should see "Status" text set to "FINAL" in the document header
    And I click the "close" button
   
  Given I am on the "Central Admin" system tab
  When I click the "Payment" link
    And I click the "Create new" button
    And I am in the "Document Overview" tab
    And I set "Description" to "1099-001"
    And I set "Explanation" to "Add 1099 Payment"
   
  When I am in the "Edit 1099 Payment" tab
    And I set "Disbursement Date" to "11/01/2013" in the "New" subsection
    And I set "Payment Type Code" to "Nonemployee Compensation" in the "New" subsection
    And I set "Amount" to "100.00" in the "New" subsection
    And I start a lookup for "1099 Payee ID"
    And I set "Vendor #" to "11223-0" on the search page
    And I click the "Search" button
    And I return the record with "Vendor #" of "11223-0" on the search page
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    
  When I click "Show" on the "Route Log" tab
    And I click the "reload" button
    And I should see "Status" text set to "FINAL"
