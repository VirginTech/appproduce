class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :developer, index: true, foreign_key: true
      t.string :appname
      t.text :summary
      t.text :description
      t.integer :category
      t.integer :price
      t.integer :model
      t.string :img_icon
      t.string :img_screenshot_01
      t.string :img_screenshot_02
      t.string :img_screenshot_03
      t.string :img_screenshot_04
      t.string :img_screenshot_05

      t.timestamps null: false
      
      t.index [:developer_id, :created_at]
    end
  end
end
