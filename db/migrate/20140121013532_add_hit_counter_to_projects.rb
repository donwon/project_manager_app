class AddHitCounterToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :hit_counter, :integer, default:0
  end
end
