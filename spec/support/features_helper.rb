module FeatureHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in "Login", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
  end
end
