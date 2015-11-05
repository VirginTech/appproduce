class Product < ActiveRecord::Base
  
  belongs_to :developer
  
  mount_uploader :img_icon, ImageUploader
  
  #========================
  #バリデーション
  #========================
  validates :developer_id, presence: true
  validates :appname, presence: true
  
end
