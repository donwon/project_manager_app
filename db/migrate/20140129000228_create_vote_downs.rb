class CreateVoteDowns < ActiveRecord::Migration
  def change
    create_table :vote_downs do |t|
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
