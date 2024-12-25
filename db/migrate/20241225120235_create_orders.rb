class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.datetime :date, null: false
      t.references :user, null: false, foreign_key: true
      t.string :address, null: false

      t.timestamps
    end
  end
end
