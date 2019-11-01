class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :detail
      t.string :date

      t.timestamps
    end
  end
end
