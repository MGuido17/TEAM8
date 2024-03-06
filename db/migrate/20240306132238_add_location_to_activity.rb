class AddLocationToActivity < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :address, :string
    add_column :activities, :location, :string
    add_column :activities, :time, :string
  end
end
