require 'minitest_helper'

feature 'admin profile' do
  background do
    logout_admin
    login_admin
    visit '/backend/profile'
  end

  focus
  scenario 'Admin navigates to profile and update name' do
    within('#new_profile') do
      fill_in 'profile_name', with: 'Super admin'
    end
    click_button 'update'

    assert page.has_text?('Su informacion fue actualizada')
  end
end
