class AddCompletedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :completed, :integer, default: 0
  end
end
