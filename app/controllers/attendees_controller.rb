class AttendeesController < ApplicationController
  
  def create
    @activity = Activity.find(params[:activity_id])
    @attendee = @activity.attendees.build(user: current_user)

    if @attendee.save
      redirect_to @activity, notice: "Asistance confirmed!"
    else
      redirect_to @activity, alert: "There's been an error while confirming your asistance. Please try again later."
    end
  end
end
