class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.belongs_to :venue, null: false, foreign_key: true
      t.string :row
      t.integer :column
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
