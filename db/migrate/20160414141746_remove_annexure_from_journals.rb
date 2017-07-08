class RemoveAnnexureFromJournals < ActiveRecord::Migration
  def change
    remove_column :journals, :annexure_2, :boolean
  end
end
