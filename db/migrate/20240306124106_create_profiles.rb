class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :gender
      t.string :blood_type
      t.string :allergies
      t.string :medical_conditions
      t.string :contact_phone_number
      t.string :contact_address
      t.string :preferred_comunication_language
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.string :emergency_contact_relationship
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
