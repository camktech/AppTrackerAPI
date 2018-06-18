class ApplicationController < ActionController::API
  before_action :ensure_user_authenticated

  def current_user
    session[:user_id] = 5
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def render_error(message, status = 401)
    render json: {error: {message: message}}, status: status
  end

  def ensure_user_authenticated
    # TODO: add JWT
    if current_user.nil?
      render_error('user not authenticated', 401)
    end
  end

end
