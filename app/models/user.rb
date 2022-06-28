class User < ApplicationRecord
  has_many :deals, foreign_key: :user_id, class_name: 'Deal', dependent: :destroy
  has_many :categories, foreign_key: :user_id, class_name: 'Category', dependent: :destroy
end
