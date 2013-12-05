@PRE001
  Feature: PRE001 Initiate Pre-Encumbrance

  Description:
  	Initiate Pre-Encumbrance

  Background:
  	Given I am up top

  @Day1 @PRE001-01
  Scenario: Initiate Pre-Encumbrance

  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Pre-Encumbrance" link
    And I am in the "Document Overview" tab
    And I set "Description" to "TEST Pre-Encumbrance"
    And I set "Explanation" to "TEST Pre-Encumbrance"
  When I am in the "Accounting Lines" tab
    And I set "Chart" to "UA" in the "Encumbrance" subsection
    And I set "Account Number" to "1732100" in the "Encumbrance" subsection
    And I set "Object" to "4840" in the "Encumbrance" subsection
    And I set "Amount" to "505.05" in the "Encumbrance" subsection
    And I click the "Add" button in the "Encumbrance" subsection
  Then I click the "Save" button

  When I click "Show" on the "Route Log" tab
    And I click "Show" on the "Future Action Requests" tab
    And I should see "Requested Of" text set to "Fred FiscalOfficer"
    And I click the "Submit" button
