class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :stems

end
