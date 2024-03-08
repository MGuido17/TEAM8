class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    @profile.user = @user  # Associate the profile with the user

    if @profile.save
      redirect_to profile_path(@profile), notice: 'Profile was successfully created.'  # Use the profile_path helper
    else
      render :new, status: :unprocessable_entity
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
      :gender, :contact_phone_number, :contact_address,
      :blood_type, :allergies,
      :preferred_comunication_language, :emergency_contact_name,
      :emergency_contact_phone, :emergency_contact_relationship, :user_id, medical_condition: [], mental_health_condition: []
    )
  end
end
