class AddColumnToJournalpayment < ActiveRecord::Migration[5.0]
	def up
		add_attachment :journalpayments, :paper
	end

	def down
		remove_attachment :journalpayments, :paper
	end
end
