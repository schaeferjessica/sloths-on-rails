class CreateSloths < ActiveRecord::Migration[6.0]
  def change
    create_table :sloths do |t|
      t.string :name
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.text :details
      t.string :photo
      t.integer :price

      t.timestamps
    end
  end
end
