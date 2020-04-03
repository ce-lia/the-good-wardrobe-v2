class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.boolean :second_hand
      t.date :purchase_date
      t.date :discard_date
      t.string :brand
      t.string :origin
      t.string :category
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
