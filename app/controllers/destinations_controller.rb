class DestinationsController < ApplicationController

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
          redirect_to user_path(@destination.user)
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
    end
end
