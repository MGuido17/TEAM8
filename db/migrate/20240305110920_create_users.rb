class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email_adress
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :medical_conditions

      t.timestamps
    end
  end
end
