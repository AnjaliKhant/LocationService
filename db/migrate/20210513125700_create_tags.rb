class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.references :place, null: false, foreign_key: true
      t.string     :tag_0, limit: 50
      t.string     :tag_1, limit: 50
      t.string     :tag_2, limit: 50
      t.string     :tag_3, limit: 50
      t.timestamps
    end
    add_index :tags, :tag_0
    add_index :tags, :tag_1
  end
end
