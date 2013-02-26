class Admin < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, :on => :create

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  class << self
    def authenticate(email, password)
      admin = Admin.find_by_email email

      return admin if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)

      nil
    end
  end
end
