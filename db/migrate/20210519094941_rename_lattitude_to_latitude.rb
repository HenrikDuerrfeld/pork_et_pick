class RenameLattitudeToLatitude < ActiveRecord::Migration[6.0]
  def change
    rename_column :pigs, :lattitude, :latitude
  end
end
