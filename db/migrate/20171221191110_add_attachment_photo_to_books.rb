class AddAttachmentPhotoToBooks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :books do |t|
      t.attachment :cover, after: :active
    end
  end

  def self.down
    remove_attachment :books, :cover
  end
end
