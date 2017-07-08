class AddAttachmentCameraReadyPaperToPapers < ActiveRecord::Migration
  def self.up
    change_table :papers do |t|
      t.attachment :camera_ready_paper
    end
  end

  def self.down
    remove_attachment :papers, :camera_ready_paper
  end
end
