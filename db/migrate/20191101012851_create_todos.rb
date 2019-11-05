class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false, limit: 100
      t.string :detail, :limit: 1000
      t.datetime :date

      t.timestamps
    end
  end
end
