class CreateNewsArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :news_articles do |t|
      t.string :content, null: false
      t.string :label, null: false

      t.timestamps
    end
  end
end
