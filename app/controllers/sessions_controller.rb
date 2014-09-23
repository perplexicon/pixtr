class SessionsController < ApplicationController
  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end