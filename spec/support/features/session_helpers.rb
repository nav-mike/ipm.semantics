module Features
  module SessionHelpers
    def sign_in_with(email, password)
      visit '/login'
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Login'
    end

    def sign_in
      user = FactoryGirl.create :user
      visit '/login'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Login'
    end
  end
end
