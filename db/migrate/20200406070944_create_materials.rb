class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.boolean :organic
      t.boolean :recycled

      t.timestamps
    end
  end
end
