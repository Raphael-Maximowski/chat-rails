class CreateArchives < ActiveRecord::Migration[8.0]
  def change
    create_table :archives do |t|
      t.string :url, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
