class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    if resource.profile
      profile_path(resource)
    else
      new_profile_path
    end
  end

  def after_sign_up_path_for(_resource)
    new_profile_path
  end

  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # Directs user to their show page after loginw
  # before_action :authenticate_user!
  # include Pundit::Authorization

  # # Pundit: allow-list approach
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # # Uncomment when you *really understand* Pundit!
  # # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # # def user_not_authorized
  # #   flash[:alert] = "You are not authorized to perform this action."
  # #   redirect_to(root_path)
  # # end

  # private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age])
  end
end
