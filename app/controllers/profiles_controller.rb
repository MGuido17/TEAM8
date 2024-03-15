class ProfilesController < ApplicationController
  def index
    user_ids_with_invites = Invite.where(user_one: current_user)
    .or(Invite.where(user_two: current_user))
    .pluck(:user_one_id, :user_two_id)
    .flatten.uniq

    # Exclude the current user's ID from the list
    user_ids_with_invites.delete(current_user.id)

    # Fetch all users who have a profile and are not in the list of users with invites
    @users = User.includes(:profile).where.not(id: user_ids_with_invites).select { |user| user.profile.present? }
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    @profile.user = @user # Associate the profile with the user

    if @profile.save
      redirect_to profile_path(@profile), notice: 'Profile was successfully created.' # Use the profile_path helper
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if current_user.profile.nil?
      redirect_to new_profile_path
    end
    @profile = Profile.find(params[:id])
    @activities = filter_activities_by_conditions
    @invites = Invite.where(user_two: current_user)
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

  def user_conditions
    @user = current_user
    mental_health_condition = @user.profile.mental_health_condition
    medical_condition = @user.profile.medical_condition
    mental_health_condition + medical_condition
  end

  def filter_activities_by_conditions
    conditions = user_conditions
    Activity.all.filter do |activity|
      recommended_conditions = activity.recommended_conditions.any? { |condition| conditions.include?(condition) }
      recommended_conditions
    end
  end

  def profile_params
    params.require(:profile).permit(
      :gender, :contact_phone_number, :contact_address,
      :blood_type, :allergies,
      :preferred_comunication_language, :emergency_contact_name,
      :emergency_contact_phone, :emergency_contact_relationship, :user_id, medical_condition: [], mental_health_condition: []
    )
  end
end
