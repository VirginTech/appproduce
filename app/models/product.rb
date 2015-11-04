class Product < ActiveRecord::Base
  belongs_to :developer
  
  #========================
  #バリデーション
  #========================
  validates :developer_id, presence: true
  validates :appname, presence: true
  
end
