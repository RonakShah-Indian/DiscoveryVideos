Feature: Discovery Add videos to favourite functionality

  Scenario: Adding 2 videos to favourite in discovery
    Given a user goes to discovery homepage
    When a user adds videos to favourite
    Then the videos should be visible in my videos section
