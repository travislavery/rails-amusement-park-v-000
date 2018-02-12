class FixNauseaNameInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :nasea, :nausea
  end
end
