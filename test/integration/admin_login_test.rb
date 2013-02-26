require 'minitest_helper'

feature 'admin login' do
  before do
    visit '/backend/sign_in'
  end

  scenario 'Admin with valid credentials can login' do
    within('#signin') do
      fill_in 'admin_email', with: 'admin@store.com'
      fill_in 'admin_password', with: 'password'
    end
    click_button 'login'

    have_content('Bienvenido admin@store.com').must_equal true
  end

  scenario 'Admin with invalid credentials should see an error' do
    within('#signin') do
      fill_in 'admin_email', with: 'admin@store.com'
      fill_in 'admin_password', with: 'passwords'
    end
    click_button 'login'

    have_content('Por favor verifique sus credenciales').must_equal true
  end
end
