class User < ApplicationRecord
  
  has_many :tasks, dependent: :destroy
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :username, presence:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
