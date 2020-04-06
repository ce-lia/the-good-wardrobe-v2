class AddDefaultToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :status, :integer, default: 1
  end
end
