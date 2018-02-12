class AddMoodAndNaseaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mood, :integer
    add_column :users, :nasea, :integer
    rename_column :users, :username, :name
  end
end
