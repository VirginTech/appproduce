class Product < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :developer
  
  has_many :comments;
  
  mount_uploader :img_icon, ImageUploader
  mount_uploader :img_screenshot_01, ImageUploader
  mount_uploader :img_screenshot_02, ImageUploader
  mount_uploader :img_screenshot_03, ImageUploader
  mount_uploader :img_screenshot_04, ImageUploader
  mount_uploader :img_screenshot_05, ImageUploader
  
  #========================
  #バリデーション
  #========================
  validates :developer_id, presence: true
  validates :appname, presence: true
  
  #===========================
  #お気に入り(逆引：プロダクト〜ユーザー)
  #===========================
  has_many :reverse_bookmarks_relationship, class_name:  "Bookmark",
                                            foreign_key: "product_id",
                                            dependent:   :destroy
  has_many :bookmarking_users, through: :reverse_bookmarks_relationship, source: :user
  
end
