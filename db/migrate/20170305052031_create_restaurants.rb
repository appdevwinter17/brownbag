class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :website
      t.string :yelp_link
      t.string :price
      t.string :categories
      t.string :picture_url

      t.timestamps

    end
  end
end
