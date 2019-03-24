class SessionsController < ApplicationController

  def gitcreate
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to user_path(user)
  end

  def create
    @user = User.find_by(username: params[:user][:username])
   if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
        redirect_to signin_path
    end
  end

    def new 
      @user = User.new
    end


    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
end
