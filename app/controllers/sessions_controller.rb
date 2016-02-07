class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(sessions_params)
    if user
      session[:user_id] = user.id
      flash[:success] = "Hello!"
      redirect_to test_auth_path
    else
      flash.now[:error] = "Wrong pair email/password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Good bye!"
    redirect_to root_path
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
