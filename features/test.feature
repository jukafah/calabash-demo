Feature: Test feature

  Scenario: Sign in and verify username

    Given the app has launched
    When I sign in with "smomcilovic" and "t@pQ@2015!"
    And navigate to "settings"
    Then settings "username" matches "smomcilovic"

  Scenario: Create new post

    Given the app has launched
    When I sign in with "smomcilovic" and "t@pQ@2015!"
    And create a new post titled "Hello, World!"
    Then my new post is displayed