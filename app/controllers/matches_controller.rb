class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
    @message = Message.new
  end
end
