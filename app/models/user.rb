class User < ActiveRecord::Base
  
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
  
end
