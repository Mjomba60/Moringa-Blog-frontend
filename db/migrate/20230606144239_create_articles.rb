class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :category
      t.string :author_name
      t.string :title
      t.string :body
      t.date :date

      t.timestamps
    end
  end
end
