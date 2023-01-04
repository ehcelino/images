class ApplicationController < ActionController::Base
  before_action :check_timeout
  before_action :current_user

  def check_timeout
    timeout_period = 10.minutes
    if current_user && session[:last_request_at] && session[:last_request_at] < timeout_period.ago
      # current_user = nil
      # reset_session
      session[:user_id] = nil
      redirect_to new_session_path(previous_url: (root_url + request.path)), alert: "Sua sessão foi finalizada. Por favor faça login novamente."
    else
      session[:last_request_at] = Time.current
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
