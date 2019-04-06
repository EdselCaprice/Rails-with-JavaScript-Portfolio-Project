class RemoveUserIdFromDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :user_id, :integer
  end
end
