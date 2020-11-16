class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :hops
      t.string :malt
      t.string :yeast
      t.string :grain
      t.string :other_ingredients
      t.belongs_to :user
    end
  end
end
