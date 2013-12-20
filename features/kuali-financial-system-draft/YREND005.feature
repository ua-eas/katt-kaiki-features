@YREND005
  Feature: YREND005-01 Initiate Year End Salary Expense Transfer

  Description:
  	01 - Initiate Year End Salary Expense Transfer

  Background:
  	Given I am up top

  @Day1 @YREND005-01 @Draft
  Scenario: Initiate Year End Salary Expense Transfer

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Year End Salary Expense Transfer" link
    And I am in the "Document Overview" tab
    And I set "Description" to "test YESET"
    And I set "Explanation" to "test YESET"
    
  When I am in the "Ledger Balance Importing" tab
    And I set "Fiscal Year" to "2014"
    And I set "Emp ID" to "22053819"
    And I click the "Search" button
    And I check the "October" checkbox on the search page
    And I click the "return selected" button
    
  When I am in the "Accounting Lines" tab
    And I click the "copy" button    
    And I set "Accounting Number" to "1732100"
    And I click the "Save" button
    And I click the "Submit" button
    And I record this "document" number in the document header  
  
  Then I should see "document status" text set to "FINAL" in the document header
    
    
