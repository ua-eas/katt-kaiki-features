 @DV001
  Feature: DV001-01 Check ACH

  Description:
  	01 - Initiate DV with all the different payment reasons and print coversheets

  Background:
  	Given I am up top

  @Day1 @DV001-01 
  Scenario: Check ACH

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec8"
  When I click the "Disbursement Voucher" link
    And I click the "Collapse All" button
    
  When I click "Show" on the "Document Overview" tab
    And I set "Description" to "DV-001 - Independent Contractor"
    And I set "Explanation" to "Payment by check/ACH"
    And I click "Hide" on the "Document Overview" tab
  
  When I click "Show" on the "Payment Information" tab
    And I start a lookup for "Payee ID"
    And I set "Payment Reason Code" to "I - Independent Contractors" on the search page
    And I set "Vendor Name" to "Johnson*J*" on the search page
    And I click the "Search" button
    And I "return" the first record on the search page
    And I set "Check Amount" to "100.00"
    And I should see "Payment Method" set to "A - ACH/Check"
    And I set "Check Stub Text" to "TEST"
    And I record the "Check Amount" amount
    And I click "Hide" on the "Payment Information" tab
  
  When I click "Show" on the "Accounting Lines" tab
    And I fill out the "Accounting Lines" table with:
      | Chart | Account Number | Amount |
      | UA    | 1732100        | 100    |
    And I start a lookup for "Object"
    And I set "Level Code" to "OUTP" on the search page
    And I click the "Search" button
    And I return the record with "Object Code" of "3130" on the search page
    And I set "Invoice Number" to "SERV<todays date>"
    And I click the "Add" button
    And I click "Hide" on the "Accounting Lines" tab
    
  When I click "Show" on the "Contact Information" tab
    And I set "Email Address" to "testID@fakeserver.edu"
    And I click "Hide" on the "Contact Information" tab
  
  Then I click the "Save" button
    And I should see the message "Document was successfully saved"
    And I click the "submit" button
    And I should see the message "Document was successfully submitted"

  When I click "Show" on the "Route Log" tab
    And I click "Show" on the "Future Action Requests" tab
    And I record this "document" number in the document header
    And I click the "close" button
    
  Given I am logged in as "kfs-test-sys10"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button
  
  Given I am logged in as "kfs-test-sec36"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
  When I am in the "1099 Classification" tab
    And I click the "refresh from account lines" button
    And I should see "Total" text set to "Check Amount"
    And I click the "approve" button
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click "Show" on the "Route Log" tab
    And I should see "Status" set to "FINAL"
    And I click "Print Disbursement Voucher Coversheet" link
 # Popup message in IE "Do you want to open or save document" Click OPEN.
 # PDF opens a new window 
