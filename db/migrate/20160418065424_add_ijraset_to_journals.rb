class AddIjrasetToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :ijecs, :boolean
    add_column :journals, :ijraset, :boolean
  end
end
