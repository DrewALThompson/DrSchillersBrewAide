class Recipe < ActiveRecord::Base
    validates_presence_of :name, :grain, :yeast, :hops, :malt
end