class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])
    if user.nil?
      flash[:errors] = ["Invalid user"]
      render :new
    else
      login!(user)
      redirect_to(links_url)
    end
  end

  def destroy
    logout!(current_user)
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
