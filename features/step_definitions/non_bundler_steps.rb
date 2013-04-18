Given(/^I have an app with license finder and a JS dependency$/) do
  @user = ::DSL::User.new
  @user.create_nonrails_app
  @output = @user.execute_command 'license_finder dependencies add MIT my_js_dep 1.2.3'
end

When(/^I add my JS dependency$/) do
  @output = @user.execute_command 'license_finder dependencies add MIT my_js_dep 1.2.3'
end

When(/^I remove my JS dependency$/) do
  @user.execute_command 'license_finder dependencies remove my_js_dep'
end

Then(/^I should see the JS dependency in the console output$/) do
  @output = @user.execute_command 'license_finder -q'
  @output.should include 'my_js_dep, 1.2.3, MIT'
end

Then(/^I should not see the JS dependency in the console output$/) do
  @output = @user.execute_command 'license_finder -q'
  @output.should_not include 'my_js_dep, 1.2.3, MIT'
end
