class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :paper_tile
      t.text :abstract
      t.string :type_of_conference

      t.timestamps null: false
    end
  end
end
