class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:users)
      create_table :users do |t|
        t.string :email
        t.integer :pin
        t.string :valid_until
        t.string :password
        t.string :token

        t.timestamps
      end
    end
  end
end
