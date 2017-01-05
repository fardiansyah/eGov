Feature: Creating Work Order for the Line estimate
  As a registered user of the system
  I want to create/search/modify Letter of Acceptance

  @Sanity
  Scenario: Create Letter of Acceptance

#  Creating/view/modify Letter of Acceptance

    When assis_Engineer logs in
    And he choose to create letter of acceptance
    And he select the required application
    And he enters the mandatory details
    Then he save the file and view the LOA pdf
    And user will notifies that "successfully"

    And he choose to view Letter of Acceptance
    And he search for LOA

    And he choose to modify letter of acceptance
    And he search for LOA for modify
    And user will notifies that "successfully"
    And current user logs out

    @Sanity
    Scenario: Letter of Acceptance for Spillover work
#    Creating Letter of Acceptance for Spillover work

    When assis_Engineer logs in
    And he choose to create letter of acceptance
    And he select the required spillover estimate from search results
    And he enters the mandatory details for creating LOA
    Then he save the file and view the LOA pdf

      And he choose to view Letter of Acceptance
      And he search for LOA

      And he choose to modify letter of acceptance
      And he search for LOA for modify
      And user will notifies that "successfully"
      And current user logs out