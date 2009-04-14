class AddEmailAddressToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :email, :string
  end

  def self.down
    remove_column :students, :email, :string
  end
end
