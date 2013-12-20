@JV001
  Feature: Initiate Journal Voucher JV001-01

  Description:
    Initiate Journal Voucher JV001-01       

  Background:
  	Given I am up top

  @Day1 @JV001-01 @Draft
  Scenario: Journal Voucher

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Journal Voucher" link
  When I record this "document" number in the document header
  When I am in the "Document Overview" tab
    And I set the "Description" to "test JV"
    And I set the "Explanation" to "test JV"
    
  When I am in the "Journal Voucher Details" tab
    And I set the "Accounting Period" to "<Accounting Period>"
  
  When I am in the "Accounting Lines" tab
    And I set the "Chart Code" to "UA" in the "Source" subsection
    And I set the "Account Number" to "1732100" in the "Source" subsection
    And I set the "Object Code" to "<object code>" in the "Source" subsection
    And I set the "Credit" to "505.05" in the "Source" subsection
    And I click the "Add" button in the "Source" subsection
    And I set the "Chart Code" to "UA" in the "Source" subsection
    And I set the "Account Number" to "1732100" in the "Source" subsection
    And I set the "Object Code" to "<Object Code>" in the "Source" subsection
    And I set the "Debit" to "505.05" in the "Source" subsection
    And I click the "Add" button in the "Source" subsection
    
    And I click the "Save" button
    And I click the "Submit" button
  When I record this "document" number in the document header
  
  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec25"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  Given I am on the "Central Admin" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
  When I close all extra browser windows
