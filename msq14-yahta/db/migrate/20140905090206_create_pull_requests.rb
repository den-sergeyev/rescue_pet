class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.string :remote_id
    end

    add_reference :pull_requests, :repository, index: true
  end
end
