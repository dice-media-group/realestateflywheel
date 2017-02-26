class CreateBroadcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :broadcasts do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :roster, foreign_key: true
      t.text :message_body
      t.string :message_title
      t.belongs_to :message_script, foreign_key: true

      t.timestamps
    end
  end
end
