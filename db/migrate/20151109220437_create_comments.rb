class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.text :comment

      t.timestamps null: false
      t.index [:user_id, :product_id], unique: true
    end
  end
end
