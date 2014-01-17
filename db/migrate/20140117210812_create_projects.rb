class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_no
      t.string :client_name
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
