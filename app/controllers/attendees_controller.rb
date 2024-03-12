class AttendeesController < ApplicationController

  def create
    @activity = Activity.find(params[:activity_id])
    @attendee = @activity.attendees.build(user: current_user)
    @activity.update(spaces: (@activity.spaces -= 1))

    if @attendee.save
      redirect_to @activity, notice: "Asistance confirmed!"
    else
      redirect_to @activity, alert: "There's been an error while confirming your asistance. Please try again later."
    end
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @attendee = @activity.attendees.find_by(user_id: current_user.id)

    if @attendee.destroy
      redirect_to @activity, notice: "Asistance removed"
    else
      redirect_to @activity, alert: 'Hubo un error al eliminar la asistencia.'
    end
  end

end
