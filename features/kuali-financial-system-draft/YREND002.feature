@YREND002
  Feature: YREND002-01 Initiate Year End DI

  Description:
  	01 - Initiate Year End DI

  Background:
  	Given I am up top

  @Day1 @YREND002-01 @Draft
  Scenario: Initiate Year End DI

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Year End Distribution of Income and Expense" link
    And I am in the "Document Overview" tab
    And I set "Description" to "Testing YEDI"
    And I set "Explanation" to "Testing YEDI"
    
  When I am in the "Accounting Line" tab
    And I set "Chart" to "UA" in the "From" subsection
    And I set "Account Number" to "1732100" in the "From" subsection
    And I set "Object" to "0600" in the "From" subsection
    And I set "Amount" to "505.05" in the "From" subsection
    And I click the "Add" button in the "From" subsection
    And I set "Chart" to "UA" in the "To" subsection
    And I set "Account Number" to "2141300" in the "To" subsection
    And I set "Object" to "0600" in the "To" subsection
    And I set "Amount" to "505.05" in the "To" subsection
    And I click the "Add" button in the "To" subsection
  
  When I click the "Save" button
    And I click the "Submit" button
  When I record this "document" number in the document header  
   
  Then I should see "document status" text set to "FINAL" in the document header
    
    
