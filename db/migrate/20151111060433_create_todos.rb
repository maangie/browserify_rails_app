class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :content
      t.datetime :todo_date

      t.timestamps null: false
    end
  end
end
