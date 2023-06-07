class AddColumnsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :interaction_type, :string
    add_column :articles, :image_url, :string
  end
end
