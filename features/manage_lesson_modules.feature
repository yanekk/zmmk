@module
Feature: Manage lesson_modules
  In order to create and manage lesson modules
  As a creator of it all
  I want to do what i want to do

  Background:
    Given user exists with email: "yanekk@poczta.fm", password: "this_is_password"

  Scenario: Register new lesson module
    Given I am signed in as "yanekk@poczta.fm" with password "this_is_password"
    And I am on page: "/lesson_modules/new"
    When I fill in "Name" with "First module"
    And I fill in "Description" with "This is the first module description."
    And I fill in "Template" with "<div>{content}</div>"
    And I press "Create Lesson Module"
    Then I should see "Module created successfully."

