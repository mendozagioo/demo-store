require "minitest_helper"

describe Backend::ProfileController do
  before do
    stub_current_admin
  end

  describe 'show' do
    it "when admin have no profile" do
      stub_current_admin 200

      get :show

      assert_redirected_to new_backend_profile_path
    end

    it "when admin have profile" do

      get :show

      assert_response :success
      assert_template :show
      assigns[:profile].wont_be_nil
    end
  end

  describe 'new' do
    it "should new display a form" do
      stub_current_admin 200

      get :new

      assert_response :success
      assert_template :new
      assigns[:profile].wont_be_nil
    end

    it "should redirect to show if already have profile" do
      get :new

      assert_redirected_to backend_profile_path
      flash[:notice].wont_be_nil
    end
  end

  describe 'edit' do
    it "should edit display a form" do
      get :edit

      assert_response :success
      assert_template :edit
      assigns[:profile].wont_be_nil
    end
  end

  it "should get create" do
    #post :create
    assert_response :success
  end

  it "should get update" do
    #put :update
    assert_response :success
  end

end

def stub_current_admin(id = 100)
  Backend::ProfileController.class_exec(id) do |id|
    body = Proc.new{ @admin ||= Admin.find id }
    define_method :current_admin, body
  end
end
