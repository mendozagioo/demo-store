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
  end

  def create
  end

  def update
  end
end
