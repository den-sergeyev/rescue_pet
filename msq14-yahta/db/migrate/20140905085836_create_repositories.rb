class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :full_name
    end
  end
end
