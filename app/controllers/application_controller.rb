class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_last_seen_at, if: proc { |p| user_signed_in? }
  before_filter :set_online_users, if: proc { |p| user_signed_in? }

  protected

    def configure_permitted_parameters
      @labs = ["L01", "L02", "L03", "L04", "L05", "L06"]
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit :username, :email, :password, :password_confirmation, :fname, :lname, :lab, :studentnumber
      end
    end
  
   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now-7.hours)
  end

  def set_online_users
    @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours)).where.not(id: current_user.id)
  end
end
