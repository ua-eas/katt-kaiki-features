@SB001
  Feature: Day 1 – Initiate Service Billing – SB001-01

  Description:
    Initiate Day 1 – Initiate Service Billing – SB001-01   

  Background:
  	Given I am up top

  @Day1 @SB001-01 @Draft
  Scenario: Journal Voucher

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec45"
  When I click the "Service Billing" link
  When I record this "document" number in the document header
  When I am in the "Document Overview" tab
    And I set the "Description" to "Test SB"
    And I set the "Explanation" to "Test SB"
  
  When I am in the "Accounting Lines" tab
    And I set the "Chart Code" to "UA" in the "Income" subsection
    And I set the "Account Number" to "1817000" in the "Income" subsection
    And I set the "Object Code" to "<object code>" in the "Income" subsection
    And I set the "Amount" to "505.05" in the "Income" subsection
    And I click the "Add" button in the "Income" subsection
    And I set the "Chart Code" to "UA" in the "Expense" subsection
    And I set the "Account Number" to "1817000" in the "Expense" subsection
    And I set the "Object Code" to "<object code>" in the "Expense" subsection
    And I set the "Amount" to "505.05" in the "Expense" subsection
    And I click the "Add" button in the "Expense" subsection
    
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
    And I am logged in as "kfs-test-sec21"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
  When I close all extra browser windows
