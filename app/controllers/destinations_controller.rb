class DestinationsController < ApplicationController

    def index
        @destination = Destination.all
    end

    def show
    end

    def new
        @destination = Destination.new
    end
    
    def edit
    end

    def create
    end

    def update
    end
end
