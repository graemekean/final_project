class Project < ActiveRecord::Base
  has_one :mixer
  belongs_to :studio
  has_one :mix
  has_many :stems
  # has_many :users, through: :studio




end
