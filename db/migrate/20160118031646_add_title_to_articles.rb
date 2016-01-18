class AddTitleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string, :after => :name
  end
end
