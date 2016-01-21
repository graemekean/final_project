class Stem < ActiveRecord::Base
  # belongs_to :user
  belongs_to :project
  belongs_to :user
 has_many :comments, :as => :commentable
  
end
