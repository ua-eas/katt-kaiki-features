@KFSI5638
  Feature: KFSI-5638

  Description:
    This test verifies that the Asset Retirement Global search does not cause a
      malfunction.

  Background:
    Given I am up top

  @Day1 @KFSI5638-01
  Scenario: Searching under Asset Retirement Global doesnt blow up.

  Given I am logged in as "kfs-test-sec1"
  When I am on the "Central Admin" system tab
    And I click the "Asset Retirement Global" link
    And I click the "search" button
    And I do not see "HTTP Status 500"
    And I do not see "Incident Report form"
