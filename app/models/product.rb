class Product < ActiveRecord::Base

	belongs_to :admin
	has_many :photos
	validate :photos_count_within_bounds, :on => :create

  private
  def photos_count_within_bounds
    return if photos.blank?
    errors.add("Too many photos") if photos.length > 5
  end

end
