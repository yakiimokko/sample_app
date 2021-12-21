class User < ApplicationRecord
  before_save {email.downcase!} #右辺にある場合selfは省略できるから多分省略した
  #self.email = email.downcaseをやるために!をつける（代入する作業を省略した）
  #self.email.downcaseだけだとdowncaseを出力しただけで、self.emailは元の大文字のままになる
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
end