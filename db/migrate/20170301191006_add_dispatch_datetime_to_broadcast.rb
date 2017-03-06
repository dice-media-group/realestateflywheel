class AddDispatchDatetimeToBroadcast < ActiveRecord::Migration[5.0]
  def change
    add_column :broadcasts, :dispatch_datetime, :datetime
  end
end
