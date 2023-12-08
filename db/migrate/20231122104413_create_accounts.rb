class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:users)
      create_table :accounts do |t|
        t.string :first_name
        t.string :last_name
        t.string :city
        t.string :password

        t.timestamps
      end
    end
  end
end