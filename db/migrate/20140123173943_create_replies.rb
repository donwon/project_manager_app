class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.references :discussion, index: true

      t.timestamps
    end
  end
end
