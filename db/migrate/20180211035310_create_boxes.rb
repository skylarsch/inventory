class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.string  :tag, null: false, limit: 8
      t.integer :kind, null: false, default: 0
      t.string  :location

      t.timestamps

      t.index :tag
    end
  end
end
