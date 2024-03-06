class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    @activity.organiser = current_user
    if @activity.save
      redirect_to @activity, notice: "The activity has successfully been created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def activity_params
    params.require(:activity).permit(:name, :address, :description, :location, :date, :spaces, :recommended_conditions, :not_recommended_conditions, :private)
  end
end
