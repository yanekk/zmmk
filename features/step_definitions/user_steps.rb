Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) user$/ do |pos|
  visit users_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following users:$/ do |expected_users_table|
  expected_users_table.diff!(tableish('table tr', 'td,th'))
end

Given /^I am signed in as "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
    When %{I go to page: "/users/sign_in"}
    And  %{I fill in "Email" with "#{login}"}
    And  %{I fill in "Password" with "#{password}"}
    And  %{I press "Sign in"}
    Then %{I should be on the home page}
    And  %{I should see "Signed in successfully."}
end

