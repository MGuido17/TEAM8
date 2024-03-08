class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :gender, :contact_phone_number, :contact_address, :profile_picture,
      :blood_type, :allergies, :medical_conditions [], :mental_health_condition[],
      :preferred_comunication_language, :emergency_contact_name,
      :emergency_contact_phone, :emergency_contact_relationship, :user_id
    )
  end
end
