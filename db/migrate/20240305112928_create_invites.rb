class CreateInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :invites do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
