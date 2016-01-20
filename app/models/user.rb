class User < ActiveRecord::Base

  has_many :studios
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :projects
  has_one :profile
  has_many :statuses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
