class User < ActiveRecord::Base

#list main associations for the user model

  has_one :profile
  has_one :studio
  has_many :statuses

  # create join table association for friendships to associate a user with another user

  has_many :friendships
  has_many :friends, through: :friendships


  #need to create a join table linking user_ids to project_ids called projects_users with 2 foreign ids - user_id and project_id and index both of these values
  has_and_belongs_to_many :projects


  has_many :stems









  


  # create profile and studio objects for each user when the user is created

  after_create :create_profile
  after_create :create_studio

 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
