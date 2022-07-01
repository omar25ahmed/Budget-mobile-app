class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :deals, foreign_key: :user_id, class_name: 'Deal', dependent: :destroy
  has_many :categories, foreign_key: :user_id, class_name: 'Category', dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
