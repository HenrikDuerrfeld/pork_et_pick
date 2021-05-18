class CreatePigs < ActiveRecord::Migration[6.0]
  def change
    create_table :pigs do |t|
      t.string :name
      t.text :description
      t.integer :price_per_day
      t.boolean :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
