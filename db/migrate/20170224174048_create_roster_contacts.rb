class CreateRosterContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :roster_contacts do |t|
      t.belongs_to :contact, foreign_key: true
      t.belongs_to :roster, foreign_key: true

      t.timestamps
    end
  end
end
