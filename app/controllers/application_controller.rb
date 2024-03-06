class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    user_path(resource) # Directs user to their show page after login
  end
end
