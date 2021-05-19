class AddCoordinatesToPigs < ActiveRecord::Migration[6.0]
  def change
    add_column :pigs, :lattitude, :float
    add_column :pigs, :longitude, :float
  end
end
