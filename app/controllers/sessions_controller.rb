class SessionsController < ApplicationController
  skip_before_action :ensure_user_authenticated, only: :create

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      render json: user, status: 200
    else
      render_error('Wrong email or password')
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
  end

  private

    def session_params
      params.require(:user).permit(:email, :password)
    end
end
