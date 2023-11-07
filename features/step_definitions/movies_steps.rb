Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
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

  ##Happy Path 1 Start ##

  When("I go to the edit page for {string}") do |movie_title|
    # Implement the step to navigate to the edit page for the given movie title.
  end
  
  And("I fill in {string} with {string}") do |field, director_name|
    # Implement the step to fill in the "Director" field with the director's name.
  end
  
  And("I press {string}") do |button_name|
    # Implement the step to press the "Update Movie Info" button.
  end
  
  Then("the director of {string} should be {string}") do |movie_title, director_name|
    # Implement the step to verify that the director of the movie is as expected.
  end

## HAPPY PATH 1 END ##

## HAPPY PATH 2 START ##

Given("I am on the details page for {string}") do |movie_title|
  # Implement the step to navigate to the details page for the given movie title.
end

When("I follow {string}") do |link_text|
  # Implement the step to click on the "Find Movies With Same Director" link.
end

Then("I should be on the Similar Movies page for {string}") do |movie_title|
  # Implement the step to verify that you are on the Similar Movies page for the given movie title.
end

And("I should see {string}") do |movie_title|
  # Implement the step to verify that the specified movie title is displayed.
end

But("I should not see {string}") do |movie_title|
  # Implement the step to verify that the specified movie title is not displayed.
end
## HAPPY PATH 2 END ##


## SAD PATH START ##

Given("I am on the details page for {string}") do |movie_title|
  # Implement the step to navigate to the details page for the given movie title.
end

Then("I should not see {string}") do |director_name|
  # Implement the step to verify that the director's name is not displayed.
end

When("I follow {string}") do |link_text|
  # Implement the step to click on the "Find Movies With Same Director" link.
end

Then("I should be on the home page") do
  # Implement the step to verify that you are on the home page.
end

And("I should see {string}") do |message|
  # Implement the step to verify a specific message is displayed.
end

## SAD PATH END ##

end