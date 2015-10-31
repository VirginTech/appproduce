class User < ActiveRecord::Base
  
  has_secure_password
  
  #========================
  #バリデーション
  #========================
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                                      format: { with: VALID_EMAIL_REGEX },
                                      uniqueness: { case_sensitive: false }
                    
end
