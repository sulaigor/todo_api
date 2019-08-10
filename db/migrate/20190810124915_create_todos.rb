class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :text, null: false
      t.datetime :creation_date, default: Date.today
      t.boolean :marked_done, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
