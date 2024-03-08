class ActivitiesController < ApplicationController

  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :check_authorization, only: [:edit, :update, :destroy]

  before_action :set_user, only: :index

  def index
    if @user
      recommended_conditions = @user.profiles.pluck(:recommended_conditions).flatten
      neutral_conditions = @user.profiles.pluck(:neutral_conditions).flatten
      not_recommended_conditions = @user.profiles.pluck(:not_recommended_conditions).flatten

      @activities = Activity.includes(:profiles).where.not(profiles: { not_recommended_conditions: not_recommended_conditions })
                            .or(Activity.includes(:profiles).where(profiles: { recommended_conditions: recommended_conditions }))
                            .or(Activity.includes(:profiles).where(profiles: { neutral_conditions: neutral_conditions }))
    else
      # Handle the case when @user is nil
      @activities = Activity.all
    end
  end

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

  def edit
    @activity = current_user.activities.find(params[:id])
  end

  def update
    @activity = current_user.activities.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: "The activity has successfully been updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy
    redirect_to activities_path, notice: "The activity has been deleted."
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :description, :location, :date, :spaces, :private).tap do |whitelisted|
      whitelisted[:recommended_conditions] = params[:activity][:recommended_conditions].reject(&:blank?)
      whitelisted[:not_recommended_conditions] = params[:activity][:not_recommended_conditions].reject(&:blank?)
    end
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def check_authorization
    redirect_to root_path, alert: "Not authorized" unless @activity.organiser == current_user
  end

  def set_user
    @user = current_user
  end
end
