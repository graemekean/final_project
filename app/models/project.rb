class Project < ActiveRecord::Base
  belongs_to :studio
  has_many :stems
  # has_many :users, through: :studio




end
