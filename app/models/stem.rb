class Stem < ActiveRecord::Base
  # belongs_to :user
  belongs_to :membership
  has_one :user, through: :membership
  has_one :project, through: :membership
  
  has_many :comments, :as => :commentable
  
end
