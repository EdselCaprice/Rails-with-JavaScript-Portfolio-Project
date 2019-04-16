class ExperiencesController < ApplicationController
    before_action :set_experience, only: [:show, :edit, :update, :destroy]


    def index
        @experiences = Experience.all
    end

    def show
        @experience = set_experience
    end

    def new
        @experience = Experience.new
        #@experience.build_destination
        
    end
    
    def edit
    end

    def create
        @experience = Experience.new(experience_params)
        @experience.destination = Destination.find_by(id: params[:destination_id])
        @experience.user = current_user
        if @experience.save
            redirect_to user_destination_path(current_user, @experience.destination)
        else
            render :new
        end
    end 

    def update
        if @experience.update(experience_params)
            redirect_to user_destination_path(current_user, @experience.destination)
        else
            render :edit
        end
    end

    def destroy
        @experience.destroy
        redirect_to user_destination_path(current_user, @experience.destination)
    end

    private

    def set_experience
        @experience = Experience.find(params[:id])
      end

    def experience_params
        params.require(:experience).permit(:activity)
    end

end
