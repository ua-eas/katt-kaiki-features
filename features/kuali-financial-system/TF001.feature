@TF001
  Feature: TF001 Initiate Transfer of Funds

  Description:
  	Initiate Transfer of Funds

  Background:
  	Given I am up top

  @Day1 @TF001-01
  Scenario: Initiate Transfer of Funds

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Transfer of Funds" link
  
    And I am in the "Document Overview" tab
    And I set "Description" to "TEST ID"
    And I set "Explanation" to "TEST ID"
    
  When I am in the "Accounting Lines" tab
    And I set "Chart" to "UA" in the "From" subsection
    And I set "Account Number" to "1732100" in the "From" subsection
    And I set "Object" to "7930" in the "From" subsection
    And I set "Amount" to "505.05" in the "From" subsection
    And I click the "Add" button in the "From" subsection
    And I set "Chart" to "UA" in the "To" subsection
    And I set "Account Number" to "1080000" in the "To" subsection
    And I set "Object" to "0930" in the "To" subsection
    And I set "Amount" to "505.05" in the "To" subsection
    And I click the "Add" button in the "To" subsection
  Then I click the "Save" button

  When I click "Show" on the "Route Log" tab
    And I click "Show" on the "Future Action Requests" tab
    And I should see "Requested Of" text set to "Fred FiscalOfficer"
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
    And I am logged in as "kfs-test-sec26"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec22"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec42"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec43"
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
