class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.belongs_to :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
