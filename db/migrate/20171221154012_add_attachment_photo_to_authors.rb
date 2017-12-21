class AddAttachmentPhotoToAuthors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :authors do |t|
      t.attachment :photo, after: :active
    end
  end

  def self.down
    remove_attachment :authors, :photo
  end
end
