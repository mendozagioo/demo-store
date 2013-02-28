require 'minitest_helper'

feature 'admin profile' do
  background do
    logout_admin
    login_admin
    visit '/backend/profile'
  end

  scenario 'Admin navigates to profile and update name' do
    within('#profile') do
      fill_in 'profile_name', with: 'Super admin'
    end
    click_button 'update'

    assert page.has_text?('Su informacion fue actaulizada')
  end
end
