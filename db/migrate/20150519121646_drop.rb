class Drop < ActiveRecord::Migration
  def change
  	drop_table :posts
  end 
end
