class AddIndexToTags < ActiveRecord::Migration[5.2]
  def change
    add_index :tags, %i[article_id category_id]
  end
end
