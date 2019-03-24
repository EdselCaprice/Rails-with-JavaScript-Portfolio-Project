class AddDestinationIdToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :destination_id, :integer
    add_index :experiences, :destination_id
  end
end
