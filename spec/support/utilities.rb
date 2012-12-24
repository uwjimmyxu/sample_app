include ApplicationHelper

def valid_signin(user)
   fill_in "Email", with: user.email
   fill_in "Password", with: user.password
   click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
   match do |page|
      page.should have_selector('div.alert.alert-error', text:message)
   end
end

RSpec::Matchers.define :have_valid_heading do |message|
   match do |page|
      page.should have_selector('h1', text: message) 
      page.should have_selector('title', text: message)
   end
end
