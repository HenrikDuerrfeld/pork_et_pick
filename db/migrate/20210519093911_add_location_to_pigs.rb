class AddLocationToPigs < ActiveRecord::Migration[6.0]
  def change
    add_column :pigs, :location, :string
  end
end
