class AddDispatchedAtToBroadcast < ActiveRecord::Migration[5.0]
  def change
    add_column :broadcasts, :dispatched_at, :datetime
  end
end
