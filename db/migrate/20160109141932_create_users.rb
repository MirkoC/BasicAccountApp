class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :username,            null: false
      t.string      :email,               null: false
      t.string      :full_name
      t.string      :crypted_password,    null: false
      t.string      :password_salt,       null: false
      t.string      :persistence_token,   null: false
      t.string      :single_access_token, null: false
      t.string      :perishable_token,    null: false



      t.integer     :login_count,         null: false, default: 0
      t.integer     :failed_login_count,  null: false, default: 0
      t.timestamps  :last_request_at
      t.timestamps  :current_login_at
      t.timestamps  :last_login_at
      t.string      :current_login_ip
      t.string      :last_login_ip

      t.timestamps                        null: false
    end
  end
end
