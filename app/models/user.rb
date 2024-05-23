class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :scores,dependent: :destroy
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email ,presence: :true
  validates :password ,presence: :true
end
