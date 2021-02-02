class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.float :humidity
      t.float :sunlight

      t.timestamps
    end
  end
end
