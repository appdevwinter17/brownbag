class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :host_approval
      t.boolean :guest_approval
      t.boolean :confirmed_reservation
      t.boolean :public_request
      t.string :title
      t.text :description

      t.timestamps

    end
  end
end
