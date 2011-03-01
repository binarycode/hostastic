class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.references :user

      t.string :name
      t.string :email
      t.string :subject
      t.string :ref
      t.text :body

      t.integer :status_cd, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
