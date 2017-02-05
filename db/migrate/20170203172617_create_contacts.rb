class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.text :email_address
      t.text :street_one
      t.text :street_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :primary_phone
      t.string :primary_phone_kind
      t.string :secondary_phone
      t.string :secondary_phone_kind
      t.string :addl_phone_one
      t.string :addl_phone_one_kind
      t.string :addl_phone_two
      t.string :addl_phone_two_kind
      t.string :lead_source
      t.belongs_to :user,         foreign_key: true
      

      t.timestamps
    end
  end
end
