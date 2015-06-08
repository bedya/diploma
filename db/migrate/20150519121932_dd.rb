class Dd < ActiveRecord::Migration
 def change
  	create_table :categories_posds, :id => false do |t|
  		t.integer :category_id
  		t.integer :posd_id
  	end
  	add_index :categories_posds, [:category_id, :posd_id]
  end
end
