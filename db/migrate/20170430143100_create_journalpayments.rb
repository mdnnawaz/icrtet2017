class CreateJournalpayments < ActiveRecord::Migration[5.0]
  def change
    create_table :journalpayments do |t|
      t.string :journal
      t.integer :amount
      t.boolean :isPaid, :default => false
      t.belongs_to :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
