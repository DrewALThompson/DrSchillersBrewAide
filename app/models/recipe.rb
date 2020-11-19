class Recipe < ActiveRecord::Base
    validates_presence_of :name
    belongs_to :user

  include Slugify::InstanceMethods
end