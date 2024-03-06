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

  private

  def profile_params
    params.require(:profile).permit(
      :gender, :blood_type, :allergies, :medical_condition, :mentalh_health_condition,
      :contact_phone_number, :contact_address, :preferred_comunication_language,
      :emergency_contact_name, :emergency_contact_phone, :emergency_contact_relationship, :user_id
    )
  end
end
