class AddOriginalToMessageScript < ActiveRecord::Migration[5.0]
  def change
    add_column :message_scripts, :original, :boolean, :default => false
    
  end
end
