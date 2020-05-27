class AddCoordinatesToSloths < ActiveRecord::Migration[6.0]
  def change
    add_column :sloths, :latitude, :float
    add_column :sloths, :longitude, :float
  end
end
