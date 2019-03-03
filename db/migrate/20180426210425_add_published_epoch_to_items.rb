class AddPublishedEpochToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :published_epoch, :integer
  end
end
