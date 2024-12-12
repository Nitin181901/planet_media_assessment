class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :status, null: false
      t.date :due_date, null: false
      t.timestamps
    end
  end
end
