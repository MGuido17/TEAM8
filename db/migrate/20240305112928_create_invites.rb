class CreateInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :invites do |t|
      t.boolean :status
      t.references :user_one, null: false, foreign_key: {to_table: :users}
      t.references :user_two, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
