class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :developername
      t.string :email
      t.string :password_digest

      t.timestamps null: false
      
      t.index :email, unique: true # この行を追加
    end
  end
end
