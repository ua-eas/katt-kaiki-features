@GEC002
  Feature: Day 1 – Initiate GEC – GEC002-01

  Description:
     Day 1 – Initiate GEC – GEC002-01      

  Background:
  	Given I am up top

  @Day1 @GEC002-01 @Draft
  Scenario: Initiate GEC 

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "General Error Correction" link
  When I am in the "Document Overview" tab
    And I record this "Document" number in the document header
    And I set the "Description" to "Test ID"
    And I set the "Explanation" to "Test ID"
    
  When I am in the "Accounting Lines" tab
    And I set the "Chart" to "UA" in the "Form" subsection
    And I set the "Account Number" to "1080000" in the "Form" subsection
    And I set the "Object" to "<object code>" in the "Form" subsection
    And I set the "Amount" to "505.05" in the "Form" subsection
    And I set the "Reference Origin Code" to "01" in the "Form" subsection
    And I set "Reference Number" to "<Reference number>" in the "Form" subsection
    And I click the "add" button
    And I set the "Account Number" to "1732100" in the "Form" subsection
    And I set the "Object" to "0600" in the "Form" subsection
    And I set the "Amount" to "505.05" in the "Form" subsection
    And I set the "Reference Origin Code" to "01" in the "Form" subsection
    And I set "Reference Number" to "<Reference number>" in the "Form" subsection
    And I click the "add" button
    And I click the "Save" button
    
  When I am in the "Error Certification" tab
    And I set the "Describe in detail the expenditures that are being transferred" to "Test"
    And I set the "How did this expenditure benefit the project?" to "Test"
    And I set the "How the error occurred?" to "Test"
    And I set the "Why is the error correction late?" to "Test"
    
    And I click the "Save" button
    And I click the "Submit" button
  When I record this "document" number in the document header  
    
  Then I should see "Document ID:Status" text set to ":FINAL" in the document header
