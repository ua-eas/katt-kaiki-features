@PA004-07
  Feature: PA004 Verify GL Entry

  Description:
  	Verify GL on PREQ with Sales Tax for all the different payment methods.

  Background:
  	Given I am up top

  Scenario: Verify GL Entry

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec27"
  When I click the "General Ledger Entry" link
    And I should see "Fiscal Year" set to the current fiscal year on the search page
    And I set "Chart Code" to "UA" on the search page
    And I set "Account Number" to "1732100" on the search page
    And I set "Balance Type Code" to "%" on the search page
    And I set "Fiscal Period" to "%" on the search page
    And I set the "Pending Entry Approved Indicator" option to "No" on the search page
    And I set "Document Number" to "the recorded purchase order document number" on the search page
    And I click the "Search" button
    And I should see the General Ledger Entry Lookup results table on the search page filled with:
      | Balance Type Code | Object Type Code | Debit Credit Code |
      |       EX          |        EX        |         D         |
      |       EX          |        FB        |         C         |
    
  Given I am on the "Main Menu" system tab
  When I click the "General Ledger Entry" link
    And I should see "Fiscal Year" set to the current fiscal year on the search page
    And I set "Chart Code" to "UA" on the search page
    And I set "Account Number" to "1732100" on the search page
    And I set "Balance Type Code" to "%" on the search page
    And I set "Fiscal Period" to "%" on the search page
    And I set the "Pending Entry Approved Indicator" option to "No" on the search page
    And I set "Document Number" to "the recorded payment request document number" on the search page
    And I click the "Search" button
    And I should see the General Ledger Entry Lookup results table on the search page filled with:
      | Balance Type Code | Object Type Code | Debit Credit Code |
      |       AC          |        EX        |         D         |
      |       EX          |        FB        |         D         |
      |       EX          |        EX        |         C         |
      |       AC          |        LI        |         C         |
   
  Given I am on the "Main Menu" system tab
  When I click the "General Ledger Entry" link
    And I should see "Fiscal Year" set to the current fiscal year on the search page
    And I set "Chart Code" to "UA" on the search page
    And I set "Account Number" to "1732100" on the search page
    And I set "Balance Type Code" to "%" on the search page
    And I set "Fiscal Period" to "%" on the search page
    And I set the "Pending Entry Approved Indicator" option to "No" on the search page
    And I set "Document Number" to "the recorded vendor credit memo document number" on the search page
    And I click the "Search" button
    And I should see the General Ledger Entry Lookup results table on the search page filled with:
      | Balance Type Code | Object Type Code | Debit Credit Code |
      |       AC          |        EX        |         C         |
      |       EX          |        FB        |         C         |
      |       EX          |        EX        |         D         |
      |       AC          |        LI        |         D         |
