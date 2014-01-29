class AddScoreToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :score, :integer, default:0
  end
end
