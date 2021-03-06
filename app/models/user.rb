class User < ApplicationRecord
  validates :name, presence: { message: 'Name can not be blank!' }
  # attr_accessor :current_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inventories, foreign_key: 'user_id', dependent: :destroy
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  has_many :foods, foreign_key: 'user_id', dependent: :destroy
end
