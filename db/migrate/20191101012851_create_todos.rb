class CreateTodos < ActiveRecord::Migration[6.0]
  MAX_TITLE_LIMIT = 100
  MAX_DETAIL_LIMIT = 1000

  def change
    create_table :todos do |t|
      t.string :title, :null => false, :limit => MAX_TITLE_LIMIT
      t.string :detail, :limit => MAX_DETAIL_LIMIT
      t.datetime :date

      t.timestamps
    end
  end
end
