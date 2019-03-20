class User < ApplicationRecord

    def add_wander_point
        update_points(1)
    end

    def remove_wander_point
        update_points(-1)
    end

    private

    def update_points(amount)
        self.user.update(wanderpoints: self.wanderpoints + amount)
    end



end
