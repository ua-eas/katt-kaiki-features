@YREND004
  Feature: YREND004-01 Initiate Year End Transfer of Funds

  Description:
  	01 - Initiate Year End Transfer of Funds

  Background:
  	Given I am up top

  @Day1 @YREND004-01 @Draft
  Scenario: Initiate Year End Transfer of Funds

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Year End Transfer of Funds" link
    And I am in the "Document Overview" tab
    And I set "Description" to "TEST YETF"
    And I set "Explanation" to "TEST YETF"
  
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
  
  When I click the "Save" button
    And I click the "submit" button
    And I record this "document" number in the document header  
     
  Given I am logged in as "kfs-test-sec25"
    And I am on the "Main Menu" system tab
  When I click the "document search" button
    And I click the "superuser search" button
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
    And I should see "document status" text set to "FINAL" in the document header
