class CreateDashboards < ActiveRecord::Migration[6.0]
  def change
    create_table :dashboards do |t|
      t.string :hostname
      t.string :kernel_version
      t.string :ipaddress
      t.string :macaddress
      t.string :cpuidle
      t.string :total_memory
      t.string :used_memory
      t.string :free_memory
      t.string :total_swap
      t.string :used_swap
      t.string :free_swap
      t.string :userslist
      t.string :disk_free_space
      t.string :disk_Used_space
      t.timestamps
    end
  end
end
