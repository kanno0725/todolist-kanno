class CreateCompleteds < ActiveRecord::Migration[5.2]
  def change
    create_table :completeds do |t|
      t.references :task, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
