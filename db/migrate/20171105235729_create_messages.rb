class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :host
      t.string :mac
      t.integer :tx
      t.integer :rx
      t.float :pl
      t.float :min
      t.float :max
      t.float :ave
      t.float :stddev
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
