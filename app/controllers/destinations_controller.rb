class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show, :edit, :update, :destroy]

    def index
        @destination = Destination.all
    end

    def show
    end

    def new
        @destination = Destination.new
        @destination.user_id = params[:user_id]
        @user = User.find_by(id: params[:user_id])
    end
    
    def edit
    end

    def create
        @destination = Destination.new(destination_params)
        @destination.user_id = session[:user_id]
        if @destination.save
            redirect_to user_destination_path(current_user, @destination)
        else
            render :new
        end
    end

    def update
        if @destination.update(destination_params)
            redirect_to @destination
        else
            render :edit
        end
    end

    def destroy
        @destination.destroy
        redirect_to user_path(current_user)
    end

    private

    def set_destination
        @destination = Destination.find(params[:id])
    end

    def destination_params
        params.require(:destination).permit(:location)
    end
end
