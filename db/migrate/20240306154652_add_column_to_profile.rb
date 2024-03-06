class AddColumnToProfile < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :medical_conditions
    add_column :profiles, :medical_condition, :text
    add_column :profiles, :mentalh_health_condition, :text
  end
end
