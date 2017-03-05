class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :host
      t.string :title
      t.text :description
      t.time :time
      t.date :date
      t.boolean :available
      t.integer :capacity_limit

      t.timestamps

    end
  end
end
