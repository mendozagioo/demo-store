class Product < ActiveRecord::Base

	belongs_to :admin
	has_many :photos
  validate_on_create :photos_count_within_bounds

  private
  def photos_count_within_bounds
    return if photos.blank?
    errors.add("Too many photos") if photos.length > 10
  end
  
end
