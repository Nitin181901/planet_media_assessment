class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :phone, null: false
      t.string :status, null: false, default: "active"
      t.timestamps
    end
  end
end
