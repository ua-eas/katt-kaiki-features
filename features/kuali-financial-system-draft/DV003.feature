@DV003
  Feature: Day 1 – Initiate DV – DV003-01

  Description:
     Day Day 1 – Initiate DV – DV003-01       

  Background:
  	Given I am up top

  @Day1 @DV003-01 @Draft
  Scenario: Initiate DV
  
  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Disbursement Voucher" link
  When I am in the "Document Overview" tab
    And I set the "Description" to "Test DV"
    And I set the "Explanation" to "Test DV"
    
  When I am in the "Payment Information" tab
    And I start a lookup for "Payee ID"
    And I set "Payment Reason Code" to "E - Expense Reimbursement" on the search page
    And I set "Employee ID" to "22053819" on the search page
    And I click the "Search" button
    Then I should see one or more items retrieved on the search page
  When I "return" the first record on the search page
   
  When I am in the " Payment Information" tab
    And I set the "Check Amount" to "505.05"
    And I set the "Check Stub Text" to "Test"
   
  When I am in the "Accounting Lines" tab
    And I set "Chart" to "UA" in the "Source" subsection
    And I set "Account Number" to "1732100" in the "Source" subsection
    And I set "Object Code" to "<object code>" in the "Source" subsection
    And I set "Amount" to "505.05" in the "Source" subsection
    And I set "Invoice Number" to "<invoice number>" in the "Source" subsection
    And I click the "add" button
    
    And I click the "Save" button
    And I click the "Submit" button
  When I record this "document" number in the document header
    
  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sys10"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec36"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
  When I close all extra browser windows
