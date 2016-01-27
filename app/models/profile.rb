class Profile < ActiveRecord::Base

  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true
  validates :city, presence: true
  validates :primary_discipline, presence: true



  # validates :kind, presence: true

  mount_uploader :profile_image, ImageUploader


  def self.search(search)
      if search
        losearch = search.downcase
        # where('game_name LIKE :search OR genre LIKE :search OR console LIKE :search', search: "%#{search}%")

        where('lower(first_name) LIKE :search OR lower(genres) LIKE :search OR lower(primary_discipline) LIKE :search OR lower(last_name) LIKE :search OR lower(profile_name) LIKE :search OR lower(city) LIKE :search', search: "%#{search.to_s.downcase}%")



        # where('lower(first_name) LIKE ?', "%#{search.to_s.downcase}%")
        # where('lower(primary_discipline) LIKE ?', "%#{search.to_s.downcase}%")



      end
    end

end
