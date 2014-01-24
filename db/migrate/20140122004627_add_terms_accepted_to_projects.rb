class AddTermsAcceptedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :terms_accepted, :boolean, default: false
  end
end
