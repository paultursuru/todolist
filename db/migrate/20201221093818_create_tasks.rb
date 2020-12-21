class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :priority
      t.date :deadline
      t.integer :status

      t.timestamps
    end
  end
end
