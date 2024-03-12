class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    @match_user_one = current_user
    @match_user_two = MatchUser.includes(:match).first.user == current_user ? MatchUser.includes(:match).last.user : MatchUser.includes(:match).first.user
    @message = Message.new
  end
end
