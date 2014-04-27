class AddIndexToPostsSectionId < ActiveRecord::Migration
  def change
    add_index :posts, :section_id
  end
end
