class Project < ActiveRecord::Base

 # option to set up distinct relationships between porject owners and members

  # belongs_to :owner, :class_name => 'User'
  # has_and_belongs_to_many :members, :class_name => 'User'

  
  has_and_belongs_to_many :users


  has_one :mixer
  belongs_to :studio
  has_one :mix
  has_many :stems
  # has_many :users, through: :studio




end
