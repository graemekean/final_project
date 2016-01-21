class User < ActiveRecord::Base

#list main associations for the user model

  has_one :profile
  has_one :studio

  # create join table association for friendships to associate a user with another user

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :projects
  has_many :stems
  
  has_many :statuses

  # create profile and studio objects for each user when the user is created

  after_create :create_profile
  after_create :create_studio

  # def full_name

  #   first_name + " " + last_name
  # end

  # def to_param
  #   profile_name
  # end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
