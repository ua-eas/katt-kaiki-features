@COA002
  Feature: COA002

  Description:
     01 - Initiate New Object Code

  Background:
  	Given I am up top

  @Day1 @COA002-01
  Scenario: Initiate New Object Code

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Object Code" link
    And I set "Chart Code" to something like "UA" on the search page
    And I set "Object Code" to "0010" on the search page
    And I click the "Search" button
  Then I should see one or more items retrieved on the search page
  When I "copy" the first record on the search page
  When I am in the "Document Overview" tab
    And I set the "Description" to "TEST New Object code"
    And I set the "Explanation" to "TEST New Object code"


  When I am in the "Edit Object Code" tab
    And I set the "Fiscal Year" to "2014" in the "New Copy" subsection
    And I set the "Chart Code" to something like "UA" in the "New Copy" subsection
    And I set the "Object Code" to "0001" in the "New Copy" subsection
    And I set the "Object Code Name" to "test object type" in the "New Copy" subsection
    And I set the "Object Code Short Name" to "test" in the "New Copy" subsection
  Then I should see "Reports To Object Code" set to "0010" in the "New Copy" subsection
    And I should see "Object Type Code" set to "IN" in the "New Copy" subsection
    And I should see "Level Code" set to "APPR" in the "New Copy" subsection
    And I should see "Object Sub-Type Code" set to "ST" in the "New Copy" subsection
  When I set the "Historical Financial Object Code" to "0001" in the "New Copy" subsection
  Then I should see the "Active Indicator" checkbox is "checked" in the "New Copy" subsection
    And I should see "Budget Aggregation Code" set to "O" in the "New Copy" subsection
    And I should see "Mandatory Transfer Or Eliminations Code" set to "N - NEITHER" in the "New Copy" subsection
    And I should see "Federal Funded Code" set to "N - NOT FEDERALLY FUNDED" in the "New Copy" subsection
  When I click the "Save" button
    And I click the "Submit" button
  When I record this "document" number in the document header


  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec33"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "fyi" button


  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec15"
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