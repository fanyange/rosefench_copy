class RemoveSectionFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :section
  end
end
