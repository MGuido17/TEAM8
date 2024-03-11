class InvitesController < ApplicationController
  def create
    invite = Invite.new()
    invite.user_one = current_user
    invite.user_two = User.find(params[:user_two_id])
    invite.status = false
    if invite.save
      flash[:notice] = "Invite sent successfully!"
      redirect_to profiles_path
    else
      flash[:alert] = "Failed to send the invite!"
    end
  end

  # def update
  #   invite = Invite.find(params[:id])
  #   raise
  #   if invite.update(status: true)
  #     create_match(invite.user_one, invite.user_two)
  #     flash[:notice] = "You are now Team8!"
  #   else
  #     flash[:notice] = "Don't worry you'll find a Team8"
  #   end
  # end

  def accept_invite
    invite = Invite.find(params[:id])
    if invite.update(status: true)
      create_match(invite.user_one, invite.user_two)
      # should be redirect to chatroom
      redirect_to profile_path(current_user.profile)
    else
      render "/profiles/show"
    end
  end

  def reject_invite
    invite = Invite.find(params[:id])
    if invite.update(status: false)
      invite.destroy
    end
    render "profiles/show"
  end

  private

  # def invite_params
  #   # params.require(:invite).permit(:user_two_id, :status)
  # end

  def create_match(user_one, user_two)
    match = Match.create
    MatchUser.create(match: match, user: user_one)
    MatchUser.create(match: match, user: user_two)
  end
end
