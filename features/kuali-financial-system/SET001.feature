@SET001
  Feature: SET001

  Description:
  	01 - Initiate SET

  Background:
  	Given I am up top

  @Day1 @SET001-01
  Scenario: Initiate SET

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Salary Expense Transfer" link
    And I am in the "Document Overview" tab
    And I set "Description" to "test SET"
    And I set "Explanation" to "test SET"


  When I am in the "Ledger Balance Importing" tab
    And I set "Fiscal Year" to "2014"
    And I set "Emp ID" to "22053819"
    And I click the "Search" button
    And I check the "October" checkbox on the search page
    And I click the "return selected" button


  When I am in the "Accounting Lines" tab
    And I click the "copy" button in the "From" subsection
    And I set "Account Number" to "1732100" in the "To" subsection
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

