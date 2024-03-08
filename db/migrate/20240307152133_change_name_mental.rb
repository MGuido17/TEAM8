class ChangeNameMental < ActiveRecord::Migration[7.1]
  def change
    rename_column :profiles, :mentalh_health_condition, :mental_health_condition
  end
end
