class Backend::ProfileController < ApplicationController
  def show
    @profile = current_admin.profile
    redirect_to new_backend_profile_path unless @profile
  end

  def new
    return redirect_to backend_profile_path, notice: t('.already_have_profile') if current_admin.profile.present?

    @profile = Profile.new
  end

  def edit
    @profile = current_admin.profile
    redirect_to new_backend_profile_path, notice: t('.create_a_profile') unless @profile
  end

  def create
    @profile = current_admin.build_profile profile_params.except(:admin_attributes)

    set_password_attributes!

    if @profile.valid?
      @profile.save
      return redirect_to backend_profile_path, notice: t('.profile_created')
    end

    flash[:alert] = t('.error_saving_resource')
    render :new
  end

  def update
    @profile = current_admin.profile
    return redirect_to new_backend_profile_path, notice: t('.create_a_profile') unless @profile

    set_password_attributes!

    unless @profile.update_attributes profile_params.except(:admin_attributes)
      return redirect_to edit_backend_profile_path, alert: t('.error_saving_resource')
    end

    redirect_to backend_profile_path, notice: t('.profile_updated')
  end

protected
  def set_password_attributes!
    if profile_params[:admin_attributes][:password].present?
      @profile.admin.password = profile_params[:admin_attributes][:password]
      @profile.admin.password_confirmation = profile_params[:admin_attributes][:password_confirmation]
    end
  end

  def profile_params
    params.require(:profile).permit(:name, admin_attributes: [:password, :password_confirmation, :id])
  end
end
