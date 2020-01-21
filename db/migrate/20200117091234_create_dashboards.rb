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
      t.string  :cpucount
       t.string  :top_cpu_process
       t.string  :top_memory_process
       t.string  :current_logged_in_users
       t.string  :users_password_expired
       t.string  :password_expire_date
       t.string  :users_list
       t.string  :ls_output
       t.string  :hosts_file
       t.string  :services_status
       t.string  :pvs
       t.string  :vgs
       t.string  :lvs
       t.string  :disk_utilization
       t.string  :ifconfig
       t.string  :ports_listening
      t.timestamps
    end
  end
end
