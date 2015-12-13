Given(/^the app has launched$/) do

  @page = page(LaunchPage).await

end

When(/^I sign in with "([^"]*)" and "([^"]*)"$/) do |username, password|

  @page = @page.sign_in(username, password)

end


And(/^navigate to "([^"]*)"$/) do |page|

  @page = @page.navigate_to(page)

end


Then(/^settings "([^"]*)" matches "([^"]*)"$/) do |element, exp_text|

  @page.check_settings_element(element, exp_text)

end

And(/^create a new post titled "([^"]*)"$/) do |title|

  @page.create_post(title)

end


Then(/^my new post is displayed$/) do

  @page.check_post

end
