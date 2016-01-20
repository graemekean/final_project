class User < ActiveRecord::Base


  has_one :profile
  has_one :studio

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :projects
  
  has_many :statuses

  after_create :create_profile

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
