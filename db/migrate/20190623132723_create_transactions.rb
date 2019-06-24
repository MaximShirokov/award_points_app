class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :operation_type, default: 0, null: false
      t.references :account, default: 0, unsigned: true, null: false
      t.timestamps
    end
  end
end
