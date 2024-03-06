class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      redirect_to @activity, notice: "The activity has successfully been created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def activity_params
    params.require(:activity).permit(:name, :description, :date, :organiser, :spaces, :recommended_conditions, :neutral_conditions, :not_recommended_conditions, private)
  end
end
