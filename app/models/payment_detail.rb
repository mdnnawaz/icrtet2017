class PaymentDetail < ActiveRecord::Base
	acts_as_xlsx
	belongs_to :user
	has_attached_file :dd_copy
	do_not_validate_attachment_file_type :dd_copy
	validates_uniqueness_of :user_id
	validates_presence_of :accept, :journal

end
