Given /^the following lesson_modules:$/ do |lesson_modules|
  LessonModule.create!(lesson_modules.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) lesson_module$/ do |pos|
  visit lesson_modules_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following lesson_modules:$/ do |expected_lesson_modules_table|
  expected_lesson_modules_table.diff!(tableish('table tr', 'td,th'))
end
