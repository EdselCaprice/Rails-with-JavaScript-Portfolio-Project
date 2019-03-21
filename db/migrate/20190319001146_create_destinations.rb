class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :experience, foreign_key: true
      t.string :location
      t.timestamps
    end
  end
end
