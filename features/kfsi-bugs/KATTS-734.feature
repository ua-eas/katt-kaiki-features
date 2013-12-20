@KATTS-734
Feature: KATTS-734

 Description:

  Background:
   Given I am up top

  Scenario: Viewing Role 11173 shouldn't blow up.
  Given I am on the "Administration" system tab
    And I am logged in as "kfs-test-sec21"
  When I click the "Role" link
    And I set "Role" to "11173" on the search page
    And I click the "search" button
  When I select the first document on the search page
  Then I do not see "HTTP Status 500"
    And I do not see "Incident Report form"
  When I close all extra browser windows
