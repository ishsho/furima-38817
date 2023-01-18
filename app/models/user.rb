class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  validates :email,                presence: true
  validates :encrypted_password,   presence: true
  validates :birthday,             presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :family_name_japanese, presence: true
    validates :first_name_japanese,  presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :family_name_katakana, presence: true
    validates :first_name_katakana,  presence: true
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end