class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sloth, null: false, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.integer :total_cost
      t.string :status

      t.timestamps
    end
  end
end
