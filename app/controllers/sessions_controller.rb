class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_index_path, notice: "You have successfully logged in!"
    else
      redirect_to root_path, notice: "Login unsuccessful!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logout successful"
  end
  
end
