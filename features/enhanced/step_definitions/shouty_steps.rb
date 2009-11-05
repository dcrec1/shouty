Given /^I am logged$/ do
  goto signup_path
  $browser.text_field(:id, "user_login").set($login = "dcrec1")
  $browser.text_field(:id, "user_email").set($email = "dc.rec1@gmail.com")
  $browser.text_field(:id, "user_password").set($password = "password")
  $browser.text_field(:id, "user_password_confirmation").set($password)
  $browser.button(:text, "Create User").click
end

Given /^I am on the home page$/ do
  goto root_path
end

def goto(path)
  $browser.goto @host + path
end