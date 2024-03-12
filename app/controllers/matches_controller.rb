class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    @match_user_one = @match.match_users.find_by(user: current_user).user unless @match.match_users.find_by(user: current_user).nil?
    @match_user_two = @match.match_users.where.not(user: current_user).first.user

    if @match_user_one.nil?
      redirect_to profile_path(current_user), alert: "You are not authorized to access this room."
      return
    end

    @message = Message.new
  end
end
