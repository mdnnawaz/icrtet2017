class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    if current_user.is_verified == false
      new_verification_path
    elsif current_user.admin
      dashboard_dash_path
    else
      home_path
    end
  end
  def after_sign_out_path_for(user)
    home_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me,:first_name, :last_name, :mobile_number, :college_name, :designation) }
  end

  def authorize_user
    if current_user.is_verified == false
      redirect_to new_verification_path, alert: 'Access Denied' 
    end
  end

  def authorize_admin
    if current_user.admin == false
      redirect_to root_path, alert: 'Access Denied'
    end
  end

end
