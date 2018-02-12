class FixMoodNameInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :mood, :happiness
  end
end
