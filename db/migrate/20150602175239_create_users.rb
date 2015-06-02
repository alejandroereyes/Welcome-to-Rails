class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name, nul: false
      t.string  :last_name, null: false
      t.integer :age, null: false
    end
  end
end
