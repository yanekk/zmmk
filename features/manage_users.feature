Feature: Manage users
  In order to register and manage user data
  As a user
  I want to register and manage user data

  Scenario: Register new user
    Given I am on page: "/users/sign_up"
    When I fill in "Email" with "yanekk@poczta.fm"
    And I fill in "Password" with "this_is_password"
    And I fill in "Password confirmation" with "this_is_password"
    And I press "Sign up"
    Then I should see "You have signed up successfully"

  Scenario: Login as user
    Given user exists with email: "yanekk@poczta.fm", password: "this_is_the_password"
    When I go to page: "/users/sign_in"
    And I fill in "Email" with "yanekk@poczta.fm"
    And I fill in "Password" with "this_is_the_password"
    And I press "Sign in"
    Then I should be on the home page
    And I should see "Signed in successfully."

