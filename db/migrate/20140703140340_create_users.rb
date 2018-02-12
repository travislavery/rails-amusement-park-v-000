class CreateUsers < ActiveRecord::Migration
	create_table :users do |t|
		t.string :username
		t.string :password_digest
		t.integer :tickets
		t.integer :height
	end
end
