class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :password, :email
  has_many :recipes

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
