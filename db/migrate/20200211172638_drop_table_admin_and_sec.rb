class DropTableAdminAndSec < ActiveRecord::Migration[6.0]
  def change
    drop_table :admins
    drop_table :secs
  end
end
