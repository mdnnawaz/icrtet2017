class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.boolean :annexure_1
      t.boolean :annexure_2
      t.boolean :others
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
