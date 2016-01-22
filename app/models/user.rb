class User < ActiveRecord::Base

#list main associations for the user model

  has_one :profile
  has_one :studio



  # create join table association for friendships to associate a user with another user

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :memberships
  has_many :projects, through: :memberships
  has_many :stems, through: :memberships


  #need to create a join table linking user_ids to project_ids called projects_users with 2 foreign ids - user_id and project_id and index both of these values
  # has_and_belongs_to_many :projects

  # stem_id project_id - need a join table to associate stems to projects

  


  has_many :stems
  has_many :statuses










  


  # create profile and studio objects for each user when the user is created

  after_create :create_profile
  after_create :create_studio

 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
