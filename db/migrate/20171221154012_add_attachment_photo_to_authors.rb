class AddAttachmentPhotoToAuthors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :authors do |t|
      t.attachment :cover, after: :active
    end
  end

  def self.down
    remove_attachment :authors, :cover
  end
end
