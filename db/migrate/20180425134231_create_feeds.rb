class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :link
      t.string :title
      t.text :description
      t.string :copyright

      t.timestamps
    end
  end
end
