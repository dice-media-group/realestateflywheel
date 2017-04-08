class AddBasicToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :basic, :boolean
  end
end
