def login_user(password)
  visit login_path
  within('#login') { fill_in "Email", with: user.email }
  fill_in "Password", with: password
  click_button "Login"
end