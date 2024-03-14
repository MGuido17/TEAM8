class InvitesController < ApplicationController
  def create
    existing_invite = Invite.where(user_one: current_user, user_two_id: params[:user_two_id], status: false).first
    if existing_invite.present?
      flash[:alert] = "You have already sent an invite to this user."
      redirect_to profiles_path
      return
    end
    invite = Invite.new
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

  def accept_invite
    invite = Invite.find(params[:id])
    if invite.update(status: true)
      create_match(invite.user_one, invite.user_two)
      invite.destroy
      redirect_to match_path(@match_id)
    else
      render "/profiles/show"
    end
  end

  def reject_invite
    invite = Invite.find(params[:id])
    if invite.update(status: false)
      invite.destroy
      redirect_to profile_path(current_user.profile)
    else
    render "profiles/show"
    end
  end

  private

  def create_match(user_one, user_two)
    match = Match.create!
    @match_id = match.id
    MatchUser.create(match: match, user: user_one)
    MatchUser.create(match: match, user: user_two)
  end
end
