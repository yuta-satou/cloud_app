class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :title,                   null: false
      t.text :sub_title,               null: false
      t.text :text,                    null: false
      t.integer :target_amount,        null: false
      t.integer :days,                 null: false
      t.string :tag,                   null: false
      t.timestamps
    end
  end
end
