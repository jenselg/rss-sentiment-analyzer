class AddPublishedAtToLexicons < ActiveRecord::Migration[5.2]
  def change
    add_column :lexicons, :published_at, :datetime
  end
end
