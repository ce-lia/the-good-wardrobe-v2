class CreateProportions < ActiveRecord::Migration[5.2]
  def change
    create_table :proportions do |t|
      t.integer :percentage
      t.references :product, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
