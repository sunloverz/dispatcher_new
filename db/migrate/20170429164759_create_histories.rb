class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :plane_id
      t.string :status

      t.timestamps null: false
    end
  end
end
