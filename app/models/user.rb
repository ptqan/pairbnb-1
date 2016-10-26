class User < ActiveRecord::Base
  include Clearance::User

  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "format not valid"}
  #validates :password, presence: true, format: { with: /.{5}/, message: "minimum length of 5"}
  has_many :listings
  has_many :reservations

  mount_uploader :avatar, ProfilePictureUploader

  has_many :authentications, :dependent => :destroy

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end
