class ExperiencesController < ApplicationController
    before_action :set_experience, only: [:show, :edit, :update, :destroy]


    def index
        @experiences = Experience.all
    end

    def show
    end

    def new
        @experience = Experience.new
    end
    
    def edit
    end

    def create
        @experience = Experience.new(experience_params)
        @experience.destination = Destination.find(params[:destination_id])
        if @experience.save
            #session[:experience_id] = @experience.id
            redirect_to destination_path(@experience.destination)
        else
            render :new
        end
    end 

    def update
        if @experience.update(experience_params)
            redirect_to @experience
        else
            render :edit
        end
    end

    def destroy
        @experience.destroy
        redirect_to experiences_url
    end

    private

    def set_experience
        @experience = Experience.find(params[:id])
      end

    def experience_params
        params.require(:experience).permit(:activity)
    end

end
