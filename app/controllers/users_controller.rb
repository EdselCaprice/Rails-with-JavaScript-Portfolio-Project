class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user, only: [:show, :edit, :destroy]


    def index
        @users = User.all
    end

    def show
        @other_destinations = Destination.locations
        @other_experiences = Experience.activities
        @destinations = @user.destinations
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def update
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
      end

    private

    def set_user
        @user = User.find(params[:id])
      end

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

    def authenticate_user
        if @user != current_user
            redirect_to user_path(current_user)
        end
    end
end
