class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show, :edit, :update, :destroy]
    #before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

    def index
        @destinations = Destination.all
    end

    def show
        @other_experiences = Experience.activities
    end

    def new
        @destination = Destination.new
        3.times { @destination.experiences.build }
    end
    
    def edit
    end

    def create
        @destination = Destination.create(destination_params)
        #@destination.experiences.last.user = current_user
        if @destination.save
            redirect_to user_destination_path(current_user, @destination)
        else
            render :new
        end
    end

    def update
        if @destination.update(destination_params) 
            redirect_to user_destination_path(current_user, @destination)
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
        params.require(:destination).permit(:location, experiences_attributes: [:activity, :user_id])
    end

    def authenticate_user
        set_destination
        if @destination.user != current_user
            redirect_to user_path(current_user)
        end
    end
end
