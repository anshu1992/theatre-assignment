class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :columns
      t.integer :rows
      t.timestamps
    end
  end
end
