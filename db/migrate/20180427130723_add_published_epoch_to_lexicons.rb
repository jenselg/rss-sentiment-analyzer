class AddPublishedEpochToLexicons < ActiveRecord::Migration[5.2]
  def change
    add_column :lexicons, :published_epoch, :integer
  end
end
