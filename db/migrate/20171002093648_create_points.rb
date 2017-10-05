class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.string :point
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
