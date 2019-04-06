class AddUserIdToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :user_id, :integer
    add_index :experiences, :user_id
  end
end
