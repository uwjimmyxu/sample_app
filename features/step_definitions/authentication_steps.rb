Given /^a user visits the signin page$/ do
   visit signin_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

And /^the user has an account$/ do
   @user = FactoryGirl.create(:user)
end

And /^the user submits valid signin information$/ do
   fill_in "Email", with: @user.email
   fill_in "Password", with: @user.password
   click_button "Sign in"
end

Then /^he should see his profile page$/ do
   page.should have_selector('title', text: @user.name)
   page.should have_link('Profile', href: user_path(@user))
end

And /^he should see a signout link$/ do
   page.should have_link('Sign out', href: signout_path)
   page.should_not have_link('Sign in', href: signin_path)
end
