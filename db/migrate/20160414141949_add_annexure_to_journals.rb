class AddAnnexureToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :mejsr, :boolean
    add_column :journals, :wasj, :boolean
    add_column :journals, :anas, :boolean
  end
end
