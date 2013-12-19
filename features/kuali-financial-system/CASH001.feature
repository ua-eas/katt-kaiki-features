@CASH001
  Feature: CASH001 Open Cash Drawer and Cash Maintenance Document

  Description:
  	Open Cash Drawer and Cash Maintenance Document

  Background:
  	Given I am up top
  
  @Day2 @CASH001-01
  Scenario: Open Cash Drawer and Cash Maintenance Document

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec13"
  When I click the "Cash Management" link

    And I am in the "Cash Drawer Activity" tab
    And I click the "open cash drawer" button
    And I click the "Close" button
    And I click the "Yes" button
    
  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec8"
  When I click the "Cash Receipt" link  
    And I am in the "Document Overview" tab
    And I set "Description" to "CASH-001"
    And I set "Explanation" to "Refund"
  
  When I am in the "Cash Reconciliation" tab
    And I set "Total Check Amount" to "Individual Checks/Batches"
    
  When I am in the "Check Detail" tab
    And I add to the "Check Detail" table with:
    | Check/Batch # | Date       | Description | Amt | 
    | 1234          | 10/31/2013 | Refund      | 100 |  
    And I click the "Add" button
    
  When I am in the "Accounting Lines" tab  
    And I add to the "Accounting Lines" table with:
      | Chart | Account Number | Sub-Account | Object | Sub-Object | Project | Org Ref Id | Amount  | 
      | UA    | 1732100        |             | 5780   |            |         |            | -100.00 |
    And I click "Add" on "Accounting Lines"
  When I click the "Submit" button
    And I should see the message "Document was successfully submitted."
    And I record this "document" number in the document header
    
  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec13"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click "Show" on the "Route Log" tab
    And I should see "Status" text set to "FINAL"
    And I click the "close" button
    
  Given I am on the "Central Admin" system tab  
    And I click the "Cash Management" link
    And I click the "Open Existing" button
  
  When I am in the "Deposits" tab
    And I click the "add final deposit" button
  
  When I am in the "Deposit Header" tab
    And I should see "Bank Code" set to "0001" 
    And I set "Deposit" to "1"
  
  When I am in the "Currency and Coin Detail" tab
    And I should see "Dollar Amount" set to ""    
    And I should see "Cent Amount" set to ""
    
  When I am in the "Cash Receipts" tab
    And I check the "Cash Receipts Available for Deposit" checkbox for "all"
    And I click the "create" button
  
  When I am in the "Deposits" tab    
    And I am in the "Final Deposit" section
    And I should see the Final Deposit table filled out with:
      | Amt | 100.00 |    
    And I should see the Cash Receipts table filled out with:
      | Total Check Amount | 100.00 |    
    And I click the "Submit" button
    And I should see the message "Document was successfully submitted."
  
  When I click "Show" on the "Route Log" tab
    And I click the "reload" button  
    And I should see "Status" text set to "FINAL"
