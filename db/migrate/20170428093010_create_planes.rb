class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :name
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
