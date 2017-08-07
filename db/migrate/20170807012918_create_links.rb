class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string   "slug"
      t.string   "url", limit: 1024, null: false
      t.timestamps
    end

    add_index "links", ["slug"], name: "index_links_on_slug", using: :btree
  end
end
