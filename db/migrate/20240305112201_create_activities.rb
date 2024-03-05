class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :organiser
      t.integer :spaces
      t.text :recommended_conditions
      t.text :not_recommended_conditions
      t.text :neutral_conditions
      t.boolean :private
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
