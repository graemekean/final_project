class Studio < ActiveRecord::Base
  belongs_to :user
  has_many :projects
end
