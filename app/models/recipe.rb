class Recipe < ActiveRecord::Base
    validates_presence_of :name, :grain, :yeast, :hops, :malt

    this porgarm is wack yo
end