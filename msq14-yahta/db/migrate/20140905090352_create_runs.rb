class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :state
    end

    add_reference :runs, :pull_request, index: true
  end
end
