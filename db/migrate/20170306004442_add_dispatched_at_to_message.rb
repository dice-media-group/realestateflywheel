class AddDispatchedAtToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :dispatched_at, :datetime
  end
end
