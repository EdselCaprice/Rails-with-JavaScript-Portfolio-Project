class ExperiencesController < ApplicationController

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
        @user = Experience.new(experience_params)
        if @experience.save
            session[:experience_id] = @experience.id
            redirect_to experience_path(@experience)
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
        redirect_to users_url
    end

    private

    def set_experience
        @experience = Experience.find(params[:id])
      end

    def experience_params
        params.require(:user).permit(:activity)
    end

end
