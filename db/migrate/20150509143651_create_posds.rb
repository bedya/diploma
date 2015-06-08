class CreatePosds < ActiveRecord::Migration
  def change
    create_table :posds do |t|
      t.string :title
      t.text :body
      t.date :publish_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
