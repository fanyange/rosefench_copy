def log_in(user)
  visit login_path
  fill_in "Email", with: "example@example.com"
  fill_in "Password", with: "foobar"
  click_button "Log in"
end

def log_out(user)
  click_on "退出"
end