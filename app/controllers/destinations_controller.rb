class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show, :edit, :update, :destroy]

    def index
        @destination = Destination.all
    end

    def show
    end

    def new
        @destination = Destination.create(
            :user_id => params[:user_id],
            :experience_id => params[:experience_id]
          )
                    #redirect_to new_user_destination_path(@destination.user)
    end
    
    def edit
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            session[:destination_id] = @destination.id
            redirect_to destination_path(@destination)
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
        redirect_to destinations_url
    end

    private

    def set_destination
        @destination = Destination.find(params[:id])
      end

    def destination_params
        params.require(:destination).permit(:location)
    end
end
