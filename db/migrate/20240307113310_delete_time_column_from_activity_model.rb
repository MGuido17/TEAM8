class DeleteTimeColumnFromActivityModel < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :time
  end
end
