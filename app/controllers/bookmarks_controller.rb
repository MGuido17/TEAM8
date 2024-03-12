class BookmarksController < ApplicationController
  before_action :set_activity, except: :index

  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    activity = Activity.find(params[:activity_id])
    @bookmark = current_user.bookmarks.build(activity: activity)
    if @bookmark.save
      flash[:notice] = "Activity bookmarked successfully."
      redirect_to activities_path
    else
      flash[:alert] = "Unable to bookmark activity."
      redirect_to activities_path
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
