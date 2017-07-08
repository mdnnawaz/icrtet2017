class Paper < ActiveRecord::Base
	belongs_to :user
	

	has_attached_file :paper_version1,
	:path => ":rails_root/public/system/:attachment/:id/:style/:new_paper_version1_file_name.:extension",
	:url => "/system/:attachment/:id/:style/:new_paper_version1_file_name.:extension"

	Paperclip.interpolates :new_paper_version1_file_name do |attachment, style|
		attachment.instance.new_paper_version1_file_name
	end

	has_attached_file :paper_version2,
	:path => ":rails_root/public/system/:attachment/:id/:style/:new_paper_version2_file_name.:extension",
	:url => "/system/:attachment/:id/:style/:new_paper_version2_file_name.:extension"

	Paperclip.interpolates :new_paper_version2_file_name do |attachment, style|
		attachment.instance.new_paper_version2_file_name
	end

	has_attached_file :camera_ready_paper,
	:path => ":rails_root/public/system/:attachment/:id/:style/:new_camera_ready_paper_file_name.:extension",
	:url => "/system/:attachment/:id/:style/:new_camera_ready_paper_file_name.:extension"

	Paperclip.interpolates :new_camera_ready_paper_file_name do |attachment, style|
		attachment.instance.new_camera_ready_paper_file_name
	end

	do_not_validate_attachment_file_type :paper_version1
	do_not_validate_attachment_file_type :paper_version2
	do_not_validate_attachment_file_type :camera_ready_paper
	# validates_attachment_content_type :camera_ready_paper, :content_type => [ "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]
	validates_presence_of :paper_tile, :abstract, :type_of_conference, :paper_version1, :author1

	def new_paper_version1_file_name
		"RTET#{self.type_of_conference[0,4].strip}%03d-%03d" %[self.user_id,self.id]
	end

	def new_paper_version2_file_name
		"RTET#{self.type_of_conference[0,4].strip}%03d-%03d" %[self.user_id,self.id]
	end


	def new_camera_ready_paper_file_name
		"RTET#{self.type_of_conference[0,4].strip}%03d-%03dCRP" %[self.user_id,self.id]
	end

end