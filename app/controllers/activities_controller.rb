class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    @activity.organiser = @user
    logger.debug @activity.errors.full_messages.to_sentence if @activity.invalid?
    if @activity.save
      redirect_to activity_path(@activity), notice: "The activity has successfully been created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

private

  def activity_params
    params.require(:activity).permit(:name, :address, :description, :location, :date, :spaces, :private).tap do |whitelisted|
      whitelisted[:recommended_conditions] = params[:activity][:recommended_conditions].reject(&:blank?)
      whitelisted[:not_recommended_conditions] = params[:activity][:not_recommended_conditions].reject(&:blank?)
    end
  end
end
