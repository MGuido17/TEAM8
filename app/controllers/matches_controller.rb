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

  #   def index
  #     @matches = Match.all.select { |match| match.match_users.find_by(user: current_user) }
  #     # o encontrar aqui user one y user two y pasar la variable
  #     @matches_with_users = []
  #     Match.includes(:match_users).where(match_users: { user_id: current_user.id }).each do |match|
  #       match_user_one = match.match_users.find_by(user: current_user)
  #       match_user_two = match.match_users.where.not(user: current_user).first

  #       @matches_with_users << { match_user_one: match_user_one.user, match_user_two: match_user_two.user }
  #     end
  #   end
  # end

  def index
    @matches = Match.includes(:match_users).where(match_users: { user_id: current_user.id })
    @users = User.all
  end
end
