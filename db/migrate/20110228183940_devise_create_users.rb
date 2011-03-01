class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.string :name, :null => false

      t.timestamps
    end

    change_table :users do |t|
      t.index :email, :unique => true
      t.index :reset_password_token, :unique => true
    end
  end

  def self.down
    drop_table :users
  end
end
