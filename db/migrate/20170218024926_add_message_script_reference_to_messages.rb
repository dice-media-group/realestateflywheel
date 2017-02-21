class AddMessageScriptReferenceToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :message_script, foreign_key: true
  end
end
