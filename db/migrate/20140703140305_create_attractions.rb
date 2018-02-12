class CreateAttractions < ActiveRecord::Migration
 	create_table :attractions do |t|
 		t.string :name
 		t.string :cost
 	end
end
