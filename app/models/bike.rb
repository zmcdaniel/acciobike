class Bike < ApplicationRecord
  belongs_to :user

  def self.search(search)
    where("brand || 
          model || 
          description ||
          color_primary ||
          color_secondary ||
          color_tertiary ILIKE ?", "%#{search}%")

  end


end
