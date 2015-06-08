class CategoriesPosdds < ActiveRecord::Migration
 def change
  	create_table :categories_posds, :id => false do |t|
  		t.integer :category_id
  		t.integer :post_id
  	end
  	add_index :categories_posds, [:category_id, :post_id]
  end
end
