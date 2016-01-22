class Project < ActiveRecord::Base

 # option to set up distinct relationships between porject owners and members

  # belongs_to :owner, :class_name => 'User'
  
# belongs_to :user
  belongs_to :studio
 has_many :comments, :as => :commentable
  
  # has_and_belongs_to_many :members, :class_name => "User"
  has_many :memberships
  has_many :users, through: :memberships



  has_one :mixer
  has_one :mix
  has_many :stems, through: :memberships
  # has_many :users, through: :studio




end
