class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  has_many :items
  has_many :orders

  with_options presence: true do 
    validates :nickname
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    NAME_REGEX_KANA = /\A[ァ-ヶー－]+\z/.freeze 
    validates_format_of :password, with: PASSWORD_REGEX, message: '6文字以上の半角英数字'
    validates :firstname, format: { with: NAME_REGEX }
    validates :lastname, format: { with: NAME_REGEX }
    validates :firstname_kana, format: { with: NAME_REGEX_KANA }
    validates :lastname_kana, format: { with:  NAME_REGEX_KANA }
    validates :birthday
  end
end
