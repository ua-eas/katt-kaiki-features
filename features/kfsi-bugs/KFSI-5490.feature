@KFSI5490
  Feature: KFSI-5490

  This feature tests that a Vendor creation can be cancelled and does not
  cause the server to encounter an error.

  Background:
    Given I am up top

  @Day1 @KFSI5490-01
  Scenario: Vendor creation can be cancelled

  Given I am logged in as "kfs-test-sec32"
    And I am on the "Main Menu" system tab
  When I click the "Vendor" link
    And I click the "create new" button
    And I click the "cancel" button
    And I click the "yes" button
  Then I do not see "HTTP Status 500"
    And I do not see "Incident Report form"
