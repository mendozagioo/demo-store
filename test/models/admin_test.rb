require "minitest_helper"

describe Admin do
  let(:admin) { Admin.new }

  describe 'Validations' do
    it "must be valid" do
      admin.email = 'user@store.com'
      admin.password = 'password'
      admin.password_confirmation = 'password'

      admin.valid?.must_equal true
    end

    it "must be invalid without attributes" do
      admin.valid?.must_equal false

      admin.errors.size.must_equal 3
      admin.errors[:email].wont_be_nil
      admin.errors[:password].wont_be_nil
      admin.errors[:password_confirmation].wont_be_nil
    end

    it "must invalid without unique email" do
      Admin.create email: 'user@store.com', password: '123pass', password_confirmation: '123pass'

      admin.email = 'user@store.com'
      admin.password = 'password'
      admin.password_confirmation = 'password'

      admin.valid?.must_equal false
      admin.errors[:email].wont_be_nil
    end
  end

  describe 'Password encryption' do
    it "must generate a salt and hash on save" do
      user = Admin.create email: 'user@store.com', password: '123pass', password_confirmation: '123pass'

      user.password_hash.wont_be_nil
      user.password_salt.wont_be_nil
    end

    it "must authenticate user with valid credentials" do
      user = Admin.create email: 'user@store.com', password: '123pass', password_confirmation: '123pass'

      Admin.authenticate('user@store.com', '123pass').must_equal user
    end
  end
end
