class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.string :name , null: false
      t.decimal :amount , null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end