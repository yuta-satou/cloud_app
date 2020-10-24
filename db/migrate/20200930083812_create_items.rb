class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :title,                   null: false
      t.text :sub_title,               null: false
      t.text :content
      t.integer :target_amount,        null: false
      t.integer :start_amount,         null: false
      t.integer :day_id,               null: false
      t.integer :tag_id,               null: false
      t.timestamps
    end
  end
end
