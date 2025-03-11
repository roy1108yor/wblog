class CreateChangelogs < ActiveRecord::Migration[7.0]
  def change
    create_table :changelogs do |t|
      t.string :title
      t.text :content
      t.string :version
      t.datetime :published_at

      t.timestamps
    end
  end
end
