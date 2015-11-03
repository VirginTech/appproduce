class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.string :provider
      t.string :uid
      t.string :image_url

      t.timestamps null: false
      
      #t.index :email, unique: true # この行を追加
      #複数指定
      t.index [:email, :provider, :uid], unique: true
    end
    #add_indexを使うならこちらで
    #add_index :users, [:email, :provider, :uid], unique: true
  end
end
