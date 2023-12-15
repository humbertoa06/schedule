class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.integer :day
      t.string :start_at
      t.string :end_at
      t.integer :duration
      t.string :role
      t.string :color
      t.belongs_to :employee

      t.timestamps
    end
  end
end
