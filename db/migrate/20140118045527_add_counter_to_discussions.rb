class AddCounterToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :counter, :integer
  end
end
