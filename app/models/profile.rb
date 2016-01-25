class Profile < ActiveRecord::Base

  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true
  validates :city, presence: true
  validates :primary_discipline, presence: true



  # validates :kind, presence: true

  mount_uploader :profile_image, ImageUploader

end
