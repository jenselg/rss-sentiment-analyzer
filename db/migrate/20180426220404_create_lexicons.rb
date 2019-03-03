class CreateLexicons < ActiveRecord::Migration[5.2]
  def change
    create_table :lexicons do |t|
      t.string :word
      t.float :sentiment

      t.timestamps
    end
  end
end
