class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :status
      t.string :species
      t.string :description
      t.timestamps
    end
  end
end
