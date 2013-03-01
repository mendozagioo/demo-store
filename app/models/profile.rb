class Profile < ActiveRecord::Base
  belongs_to :admin

  validates :name, :admin_id, presence: true

  accepts_nested_attributes_for :admin, :reject_if => :new_record?, update_only: true
end
