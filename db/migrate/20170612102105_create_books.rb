class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :section
      t.integer :batch
      t.integer :size
      t.integer :callnr
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
