Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

When(/^I go to the edit page for "([^"])"$/) do |movie_title|
  # Implement the step to navigate to the edit page for the specified movie title.
end

When(/^I fill in "Director" with "([^"])"$/) do |director_name|
  # Implement the step to fill in the "Director" field with the director's name.
end

When(/^I press "Update Movie Info"$/) do
  # Implement the step to press the "Update Movie Info" button.
end

When(/^I follow "Find Movies With Same Director"$/) do
  # Implement the step to click on the "Find Movies With Same Director" link.
end

Then(/^I should be on the Similar Movies page for "([^"])"$/) do |movie_title|
  # Implement the step to verify that you are on the Similar Movies page for the specified movie title.
end

Then(/^I should see "([^"])"$/) do |movie_title|
  # Implement the step to verify that the specified movie title is displayed.
end

Then(/^I should not see "([^"])"$/) do |movie_title|
  # Implement the step to verify that the specified movie title is not displayed.
end

Then(/^I should be on the home page$/) do
  # Implement the step to verify that you are on the home page.
end

Then(/^I should see "([^"])" has no director info$/) do |movie_title|
  # Implement the step to verify a specific message is displayed.
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end


end