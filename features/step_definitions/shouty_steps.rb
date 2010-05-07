Given /^I am logged$/ do
  visit signup_path
  fill_in "user_login", :with => ($login = "dcrec1")
  fill_in "user_email", :with => ($email = "dc.rec1@gmail.com")
  fill_in "user_password", :with => ($password = "password")
  fill_in "user_password_confirmation", :with => $password
  click_button "Create"
end

Given /^I exist$/ do
  $User = User.create! :login => "dcrec1",
                       :email => "dc.rec1@gmail.com",
                       :password => "mouseoverstudio",
                       :password_confirmation => "mouseoverstudio"
end

Given /^I log in$/ do
  visit login_path
  fill_in "user_session_login", :with => $User.login
  fill_in "user_session_password", :with => $User.password
  click_button "Login"
end

Then /^I should see shouties table$/ do |table|
  table.raw.flatten.should == Hpricot(page.body).search(".shouty > .body").collect { |body| body.inner_text }
end
