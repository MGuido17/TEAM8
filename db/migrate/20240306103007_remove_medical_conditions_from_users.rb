class RemoveMedicalConditionsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :medical_conditions
  end
end
