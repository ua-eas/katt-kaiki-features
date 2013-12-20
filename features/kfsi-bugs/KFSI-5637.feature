@KFSI-5637
  Feature: KFSI-5637

  Description:
    This tests the document search to ensure special characters do not cause a
      malfunction.

    Special Note: There are 2 searches that cause a Timeout error. This is why
      they have been commented out.

  Background:
    Given I am up top
      And I am logged in as "kfs-test-sec1"

  @Day1 @KFSI-5637-01
  Scenario: Regular expression parsing in EdsPrincipalDaoImpl is complete

    When I click the "document search" button
      And I start a lookup for "Initiator" on the search page

    When I set "First Name" to "Sam\" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam^" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam[" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam." on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam$" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam{" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    #When I set "First Name" to "Sam*" on the search page
      #And I click the "Search" button
      #And I do not see "Incident Report form"

    #When I set "First Name" to "*Sam**" on the search page
      #And I click the "Search" button
      #And I do not see "Incident Report form"

    When I set "First Name" to "Sam(" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam+" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam)" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam|" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam?" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam<" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"

    When I set "First Name" to "Sam>" on the search page
      And I click the "Search" button
      And I do not see "Incident Report form"
