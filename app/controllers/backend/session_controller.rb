class Backend::SessionController < ApplicationController
  before_action :already_in_session!, except: :destroy

  def new
    @admin = Admin.new
  end

  def create
    email = params[:admin][:email]
    password = params[:admin][:password]

    @admin = Admin.authenticate email, password

    if @admin
      session[:admin_id] = @admin.id
      return redirect_to backend_root_path
    end

    flash.now[:alert] = t('login_errors.message')
    @admin = Admin.new email: email
    render :new
  end

  def destroy
    session[:admin_id] = nil

    redirect_to backend_sign_in_path
  end
end
