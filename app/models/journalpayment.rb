class Journalpayment < ApplicationRecord
	belongs_to :user

	validates_presence_of :journal, :paper


	has_attached_file :paper,
	:path => ":rails_root/public/system/:attachment/:id/:style/:new_paper_file_name.:extension",
	:url => "/system/:attachment/:id/:style/:new_paper_file_name.:extension"

	Paperclip.interpolates :new_paper_file_name do |attachment, style|
		attachment.instance.new_paper_file_name
	end
	validates_attachment_file_name :paper, :matches => [/doc\Z/, /docx\Z/]
	# validates_attachment_content_type :paper, :content_type => [ "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]


	def new_paper_file_name
		if self.journal.include? "Annexure-II"
			"AII%03d" %[self.id]
		elsif  self.journal.include? "Scopus"
			"SI%03d" %[self.id]
		elsif self.journal.include? "Google"
			"GI%03d" %[self.id]
		end
	end
end
