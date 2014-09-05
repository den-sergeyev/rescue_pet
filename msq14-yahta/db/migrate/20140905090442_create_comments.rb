class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :commit_id
      t.string :position
      t.string :path
      t.string :remote_id
    end

    add_reference :comments, :run, index: true
  end
end
