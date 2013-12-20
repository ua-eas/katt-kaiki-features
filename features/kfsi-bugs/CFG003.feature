@CFG
Feature: Vendor Maintenance

  Background:
    Given I am up top

  @CFG001-PA-01
  Scenario: CFG001-PA-01
    Business Process is CFG001 - Cost Source
    Test Scenario is CFG001-PA-01

  Given I am on the "Maintenance" system tab
    And I am logged in as "kfs-test-sec47"
  When I click the "Cost Source" link
    And I click the "create new" button
    And I am in the "Document Overview" tab
    And I set the "Description" to "testing: CFG001-PA-01"
    And I click "Hide" on the "Document Overview" tab
    And I am in the "Edit Cost Source" tab
    And I set the "Cost Source Code" to "KA{2i}" in the "New" subsection
    And I set the "Cost Source Description" to "Kaiki" in the "New" subsection
    And I set the "Item Unit Price Lower Variance Percent" to "20" in the "New" subsection
    And I set the "Item Unit Price Upper Variance Percent" to "10" in the "New" subsection
    And I click the "submit" button
    And I click "Show" on the "Route Log" tab
  Then I should see "ID:" in the "routeLog" iframe
    And  I should see "Actions Taken" in the "routeLog" iframe
    And I record this "document" number in the document header


  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec20"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button


  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec47"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
  When I close all extra browser windows


  @CFG003-PA-04
  Scenario: CFG003-PA-04
    Business Process is CFG003 - Campus Parameter
    Test Scenario is CFG003-PA-04

  Given I am on the "Maintenance" system tab
    And I am logged in as "kfs-test-sec47"
  When I click the "Campus Parameter" link
    And I click the "search" button
    And I edit the record with "Campus Name" of "Main Campus" on the search page
  When I am in the "Document Overview" tab
    And I set the "Description" to "testing: CFG001-PA-01"
    And I click "Hide" on the "Document Overview" tab
  When I am in the "Edit Campus Parameter" tab
    And I uncheck the "Active Indicator" checkbox in the "New" subsection
    And I click the "submit" button
    Then I should see the message "Document was successfully submitted."
  When I click "Show" on the "Route Log" tab
  Then I should see "ID:" in the "routeLog" iframe
    And I should see "Actions Taken" in the "routeLog" iframe
    And I record this "document" number in the document header


  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec20"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I click the "approve" button


  Given I am on the "Main Menu" system tab
    And I am logged in as "kfs-test-sec47"
  When I click the "document search" button
    And I set "Document/Notification Id" to "the recorded document number" on the search page
    And I click the "search" button
    And I open the saved document with "Document/Notification Id" of "the recorded document number" on the search page
  Then a new browser window appears
    And I should see "Status" text set to "FINAL" in the document header
  When I close all extra browser windows

    # Untested: Click Button: Route Log/Pending Action Requests (if tab is present)
    # Untested: This tab should display the individual that this document is routed to along with the appropriate action description
    # Untested: Click Button: Route Log/Future Action Requests
    # Untested: This tab should display the individual(s) that this document is routed in addition to the pending route. The appropriate action description should appear.
