class User < ActiveRecord::Base
  
  has_many :products
  has_many :comments
  
  has_secure_password
  
  #========================
  #バリデーション
  #========================
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates :nickname, presence: true, length: { maximum: 50 }, on: [:registration,:update]
  validates :email, presence: true, length: { maximum: 255 },
                                      format: { with: VALID_EMAIL_REGEX },
                                      uniqueness: { case_sensitive: false },
                                      on: [:registration,:update]
  
  #=====================================================
  #OAuthの情報からユーザーを検索し、なければ新規レコード作成
  #=====================================================
  def self.find_or_create_from_auth(auth)
    provider=auth[:provider]
    uid=auth[:uid]
    if provider == "twitter"
      nickname=auth[:info][:nickname]
    elsif provider == "facebook"
      nickname=auth[:info][:name]
    else
      
    end
    image_url=auth[:info][:image]
    
    # レコードには全定義を入れる必要あり
    User.find_or_create_by(uid: uid) do |user|
      #binding.pry
      user.provider = provider
      user.nickname = nickname
      user.image_url = image_url
      user.email = ' ' # 何か入れないと「rollback transaction」で保存されない!
      user.password = ' ' # 何か入れないと「rollback transaction」で保存されない!
    end
  end
  
  #===========================
  #お気に入り(正引：ユーザー〜プロダクト)
  #===========================
  has_many :forward_bookmarks_relationship, class_name:  "Bookmark",
                                            foreign_key: "user_id",
                                            dependent:   :destroy
  has_many :bookmarking_products, through: :forward_bookmarks_relationship, source: :product
  
  # アプリをブックマークする
  def bookmarking(other_product)
    forward_bookmarks_relationship.create(product_id: other_product.id)
  end

  # ブックマークを解除する
  def unbookmarking(other_product)
    forward_bookmarks_relationship.find_by(product_id: other_product.id).destroy
  end

  # アプリをブックマークしてるかどうか？
  def bookmarking?(other_product)
    bookmarking_products.include?(other_product)
  end
  
end
