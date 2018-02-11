class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.bigint :box_id, null: false
      t.string :name

      t.timestamps

      t.index :box_id
      t.index :name
    end
  end
end
