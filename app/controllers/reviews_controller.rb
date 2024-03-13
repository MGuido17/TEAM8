class ReviewsController < ApplicationController
  before_action :set_activity

  def new
    @review = @activity.reviews.build
  end

  def show
    @review = Review.includes(:user).find(params[:id])
  end

  def index
    @reviews = @activity.reviews.all
  end

  def create
    @review = @activity.reviews.build(review_params.merge(user: current_user))
      if @review.save
        redirect_to activity_reviews_path(@activity), notice: "Review was successfully created!"
      else
        render :new
      end
  end

private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
